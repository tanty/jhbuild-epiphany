#!/bin/bash

BASE_PATH="/opt/epiphany/"

pushd ${BASE_PATH}/jhbuild.git && git pull
./autogen.sh --prefix=${BASE_PATH}/jhbuild-install && make && make install
popd
${BASE_PATH}/jhbuild-webkit/install-dependencies
${BASE_PATH}/jhbuild-install/bin/jhbuild sysdeps --install
${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc make cairo fonts fontconfig freetype6 harfbuzz libxml2 gdk-pixbuf gtk+ glib glib-networking gnome-icon-theme gnome-icon-theme-symbolic gnome-themes-standard gtk-doc libsoup atk at-spi2-core at-spi2-atk gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav xserver libsecret dconf vala WebKit epiphany --nodeps
pushd ${HOME}/.local/share/applications && ln -s ${BASE_PATH}/jhbuild-epiphany-browser.desktop
popd

