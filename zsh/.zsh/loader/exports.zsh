for file in $ZDOTDIR/exports/*; do
    source_file "$file"
done

# [ -f "$HOME/.config"/fzf/fzf.zsh ] && source "$HOME/.config"/fzf/fzf.zsh
#
# this_path=$(dirname $0)
#
# echo $this_path


export IDF_PATH=~/iot/esp/esp-idf

#
# set VIMODE according to the current mode (default “[i]”)
#
