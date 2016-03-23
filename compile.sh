#!/bin/bash

BASE_PATH="`dirname \"$0\"`"
FULL_SCRIPT_PATH=$(readlink -f $0)
FULL_BASE_PATH="`dirname \"$FULL_SCRIPT_PATH\"`"
VERSION=`grep webkitgtk ${BASE_PATH}/jhbuild-epiphany.modules | grep version | cut -d \" -f 4`


sed -e 's|@BASE_PATH@|'${FULL_BASE_PATH}'|g' ${BASE_PATH}/jhbuild-epiphany-browser.desktop.in > ${BASE_PATH}/jhbuild-epiphany-browser.desktop
sed -e 's|@BASE_PATH@|'${FULL_BASE_PATH}'|g' ${BASE_PATH}/jhbuild-epiphany-browser-incognito.desktop.in > ${BASE_PATH}/jhbuild-epiphany-browser-incognito.desktop

if [ ! -d ${BASE_PATH}/jhbuild.git ]; then
    git clone git://git.gnome.org/jhbuild ${BASE_PATH}/jhbuild.git
fi
pushd ${BASE_PATH}/jhbuild.git && git pull
./autogen.sh --prefix=${FULL_BASE_PATH}/jhbuild-install && make && make install
popd
if [ ! -d ${BASE_PATH}/jhbuild-webkit ]; then
    svn export -r HEAD http://svn.webkit.org/repository/webkit/releases/WebKitGTK/webkit-${VERSION}/Tools/gtk ${BASE_PATH}/jhbuild-webkit
fi

# Commented out to avoid asking for sudo in Debian. Just run this as root:
#${BASE_PATH}/jhbuild-webkit/install-dependencies

${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc sysdeps --install
#${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc build -f --nodeps
${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc build --nodeps
