#!/bin/bash

BASE_PATH="`dirname \"$0\"`"
FULL_SCRIPT_PATH=$(readlink -f $0)
FULL_BASE_PATH="`dirname \"$FULL_SCRIPT_PATH\"`"

export MOZ_PLUGIN_PATH=${BASE_PATH}/install/lib/mozilla/plugins/
export G_TLS_GNUTLS_PRIORITY=${G_TLS_GNUTLS_PRIORITY:-NORMAL:%COMPAT:\!VERS-SSL3.0}

# https://bugs.freedesktop.org/show_bug.cgi?id=85064
export LIBGL_DRI3_DISABLE=1

export XCURSOR_THEME=Adwaita
#export XCURSOR_THEME=DMZ-White

${BASE_PATH}/jhbuild-install/bin/jhbuild -f ${BASE_PATH}/jhbuildrc run gdb -ex 'handle SIG33 pass nostop noprint' -ex 'handle SIGUSR2 pass nostop noprint' -ex 'set pagination 0' $@
