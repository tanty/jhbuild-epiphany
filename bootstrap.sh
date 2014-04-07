#!/bin/bash

BASE_PATH="`dirname \"$0\"`"
FULL_SCRIPT_PATH=$(readlink -f $0)
FULL_BASE_PATH="`dirname \"$FULL_SCRIPT_PATH\"`"

echo $FULL_BASE_PATH

sed -e 's|@BASE_PATH@|'$FULL_BASE_PATH'|g' $BASE_PATH/jhbuild-epiphany-browser.desktop.in > $BASE_PATH/jhbuild-epiphany-browser.desktop

pushd ${BASE_PATH}
git clone git://git.gnome.org/jhbuild jhbuild.git
popd
