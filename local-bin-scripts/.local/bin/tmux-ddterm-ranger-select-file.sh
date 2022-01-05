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

gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell/Extensions/ddterm --method com.github.amezin.ddterm.Extension.Toggle

tmux send-keys -t ddterm:1 -l ":" 
sleep 0.05
tmux send-keys -t ddterm:1 -l "select_file $@"
tmux send-keys -t ddterm:1 "Enter"
