#!/bin/bash

BASE_PATH="`dirname \"$0\"`"
FULL_SCRIPT_PATH=$(readlink -f $0)
FULL_BASE_PATH="`dirname \"$FULL_SCRIPT_PATH\"`"


sed -e 's|@BASE_PATH@|'${FULL_BASE_PATH}'|g' ${BASE_PATH}/jhbuild-epiphany-browser.desktop.in > ${BASE_PATH}/jhbuild-epiphany-browser.desktop

if [ ! -d ${BASE_PATH}/jhbuild.git ]; then
    git clone git://git.gnome.org/jhbuild ${BASE_PATH}/jhbuild.git
fi
pushd ${BASE_PATH}/jhbuild.git && git pull
./autogen.sh --prefix=${FULL_BASE_PATH}/jhbuild-install && make && make install
popd
if [ ! -d ${BASE_PATH}/jhbuild-webkit ]; then
    svn export -r 167344 http://svn.webkit.org/repository/webkit/releases/WebKitGTK/webkit-2.4.0/Tools/gtk ${BASE_PATH}/jhbuild-webkit
fi
${BASE_PATH}/jhbuild-webkit/install-dependencies
${BASE_PATH}/jhbuild-install/bin/jhbuild sysdeps --install
# ${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc build -f --nodeps
${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc build --nodeps
