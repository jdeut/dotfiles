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

# echo $NVIM_LISTEN_ADDRESS

nvim --server "$NVIM_LISTEN_ADDRESS" --remote "$@"

$HOME/.local/bin/run-raise-bridge.sh nvim
