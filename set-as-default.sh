#!/bin/bash

BASE_PATH="/opt/epiphany/"

cp ${BASE_PATH}/jhbuild-epiphany-browser.desktop ${HOME}/.local/share/applications/
update-desktop-database ${HOME}/.local/share/applications
# gnome-control-center info
xdg-mime default jhbuild-epiphany-browser.desktop x-scheme-handler/http x-scheme-handler/https text/html application/xhtml+xml text/xml