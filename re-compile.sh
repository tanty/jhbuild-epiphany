#!/bin/bash

BASE_PATH="`dirname \"$0\"`"
FULL_SCRIPT_PATH=$(readlink -f $0)
FULL_BASE_PATH="`dirname \"$FULL_SCRIPT_PATH\"`"

pushd ${BASE_PATH}/jhbuild.git && git pull
./autogen.sh --prefix=${FULL_BASE_PATH}/jhbuild-install && make && make install
popd
${BASE_PATH}/jhbuild-webkit/install-dependencies
#${BASE_PATH}/jhbuild-install/bin/jhbuild sysdeps --install
# ${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc build -f --nodeps
${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc build --nodeps
