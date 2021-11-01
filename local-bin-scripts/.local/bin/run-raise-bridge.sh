#!/bin/bash

focusedapp=$(get_focused_app.sh)

echo "#######################################"
echo "# $1  -  $focusedapp "
echo "#######################################"

tmux list-windows -F "#I-#{window_active}" -t Primary | grep 1-1 &> /dev/null

is_nvim_active=$?

case $1 in
    r_x11)
        
        ydotool key "super+ctrl+alt+r"
    ;;
    sakura_primary)
#        if [[ "$focusedapp" -eq "SakuraPrimary" ]] && [[ "$is_nvim_active" -eq "0" ]]
#        then
#            ydotool key "ctrl+b"
#            ydotool key "l"
#        else
#            tmux select-window -t Primary:1
#            ydotool key "super+ctrl+alt+1"
#        fi

        if [ "$focusedapp" = "SakuraPrimary" ] 
        then
            #ydotool key --up 1
            #
            #ydotool key --up 1
            #ydotool key --up super
            #ydotool key --up super
            #ydotool key --up super
            ydotool sleep 150 , key ctrl+alt+b
        else
            echo "## <---- "
            #ydotool key "x"
            #ydotool key --up "super+1"
            ydotool sleep 150 , key ctrl+alt+a
        fi
    ;;

    sakura_secondary)
        if [ "$focusedapp" = "SakuraSecondary" ] 
        then
            ydotool sleep 150 , key ctrl+alt+a
        else
            echo "## <---- "
            ydotool sleep 150 , key ctrl+alt+b
        fi
    ;;

    nvim)
        ydotool sleep 80 , key "ctrl+alt+0"
        tmux select-window -t Primary:1
    ;;

    okular)
        ydotool sleep 80 , key "ctrl+alt+9"
    ;;
esac


