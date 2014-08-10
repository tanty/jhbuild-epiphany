#!/bin/bash

BASE_PATH="`dirname \"$0\"`"
FULL_SCRIPT_PATH=$(readlink -f $0)
FULL_BASE_PATH="`dirname \"$FULL_SCRIPT_PATH\"`"

export MOZ_PLUGIN_PATH=${BASE_PATH}/install/lib/mozilla/plugins/

${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc run ${BASE_PATH}/install/bin/epiphany $@
