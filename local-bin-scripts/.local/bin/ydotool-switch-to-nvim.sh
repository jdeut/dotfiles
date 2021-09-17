#!/bin/zsh

# gxmessage $PATH
#
if [ $# -eq 0 ]
then
    echo "Please pass a filename to the program"
    exit 1
fi

pgrep nvim-qt > /dev/null

if [ $? -eq 1 ]; then
    #gxmessage nnono
    gtk-launch nvim-qt
fi

$HOME/.local/bin/nvr --remote -c 'call GuiForeground()' -p "$@"

# tmux select-window -t Primary:1
# run-raise-bridge.sh nvim

