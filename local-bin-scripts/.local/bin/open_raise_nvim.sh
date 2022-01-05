#!/bin/zsh

# gxmessage $PATH
#
if [ $# -eq 0 ] ; then
    gxmessage "Please pass a filename to the program"
    exit 1
elif [ ! -f "$@" ] ; then
    gxmessage "$@ does not exist"
    exit 1
fi

$HOME/.local/bin/nvr --remote-expr "luaeval('require[[myhelper]].open_from_ext([[$@]])')"

/home/johannes/.local/bin/run-raise-bridge.sh nvim
