#!/bin/zsh

# gxmessage $PATH
#
if [ $# -eq 0 ]
then
    gxmessage "Please pass a filename to the program"
    exit 1
fi

if [ ! -f "$@" ]
then
    gxmessage "$@ does not exist"
    exit 1
fi

# pgrep nvim-qt > /dev/null

# if [ $? -eq 1 ]; then
#     #gxmessage nnono
#     gtk-launch nvim-qt
# fi

$HOME/.local/bin/nvr "$@"

/home/johannes/.local/bin/run-raise-bridge.sh nvim

# tmux select-window -t Primary:1
