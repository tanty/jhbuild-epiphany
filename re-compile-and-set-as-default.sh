#!/bin/bash

BASE_PATH="/opt/epiphany/"

pushd ${BASE_PATH}/jhbuild.git && git pull
./autogen.sh --prefix=${BASE_PATH}/jhbuild-install && make && make install
popd
${BASE_PATH}/jhbuild-webkit/install-dependencies
#${BASE_PATH}/jhbuild-install/bin/jhbuild sysdeps --install
# ${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc build -f --nodeps
${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc build --nodeps
cp ${BASE_PATH}/jhbuild-epiphany-browser.desktop ${HOME}/.local/share/applications/
update-desktop-database ${HOME}/.local/share/applications
# gnome-control-center info
xdg-mime default jhbuild-epiphany-browser.desktop x-scheme-handler/http x-scheme-handler/https text/html application/xhtml+xml text/xml