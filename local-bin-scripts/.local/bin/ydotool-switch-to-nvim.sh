#!/bin/zsh

if [ $# -eq 0 ]
then
    echo "Please pass a filename to the program"
    exit 1
fi

export NVIM_LISTEN_ADDRESS=localhost:62531
#gxmessage "$NVIM_LISTEN_ADDRESS"

$HOME/.local/bin/nvr -cc 'tabnew' "$@"

tmux select-window -t Primary:1
run-raise-bridge.sh nvim

