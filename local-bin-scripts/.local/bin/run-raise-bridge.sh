#!/bin/bash

# focusedapp=$(get_focused_app.sh)

echo "# >> $1  -  $focusedapp "

tmux list-windows -F "#I-#{window_active}" -t Primary | grep 1-1 &> /dev/null

is_nvim_active=$?

case $1 in
    r_x11)
        ydotool key "super+ctrl+alt+r"
    ;;
    sakura_primary)
        ydotool sleep 100 , key "super+ctrl+alt+0" &> /dev/null
    ;;
    sakura_secondary)
        ydotool sleep 100 , key "super+ctrl+alt+a" &> /dev/null
    ;;
    nvim)
        ydotool sleep 100 , key "super+ctrl+alt+0" &> /dev/null
        tmux select-window -t Primary:1
    ;;
    okular)
        ydotool sleep 100 , key "super+ctrl+alt+9" &> /dev/null
    ;;
esac
