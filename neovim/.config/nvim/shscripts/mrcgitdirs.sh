#!/bin/bash 
#set -x
project_dirs () {
    search_dirs="-E .config/obs-studio -E .config/dein.vim --search-path=.dotfiles --search-path=Bildung --search-path=.config"

    fdfind -H -t d '\.git$' $search_dirs | \
        sed 's/\.git$//' | \
        xargs -i dash -c \
            "cd {} && git --no-pager log -1 --oneline --format='{};%ct'" | \
        q -d ";" "SELECT a.c1 FROM - AS a ORDER BY a.c2 DESC"
}

project_files () {
    dir="${1%/}"

    files=$(
        fdfind -t f \
            -E '*.png' -E '*.jpg' -E '*.pdf' -E 'tags' \
            --base-directory "$dir" \
            .
    )

    mru_files=$(
        eval "cd \"$dir\" && echo \"$files\" | xargs ls -1 --color=always -d -t"
    )

    echo "$mru_files"
}

fzf_project_files () {
    cat | \
    fzf --ansi --sync +s \
        --bind "ctrl-f:execute(floaterm '$HOME/$dir/{}')+abort" \
        --bind "ctrl-o:execute(floaterm '$HOME/$dir/{}')+abort"
}

fzf_project_dirs () {
    cat | \
    fzf --sync --ansi +s \
        --bind "ctrl-n:execute(xdg-open '$HOME/{}')" \
        --bind "ctrl-f:execute(floaterm '$HOME/{}')+abort" \
        --bind "ctrl-space:execute(nvr --remote-send '<C-\\><C-n>:vnew $HOME/{}')+abort" \
        --preview-window="right:40%" \
        --preview 'cd {} && git -c color.status=always status'
}

FZF_DEFAULT_OPTS='
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'

cd $HOME

dir=$( project_dirs | fzf_project_dirs )
dir=${dir%/}

if [[ ! "$dir" = "" ]] ; then

    file=$( project_files "$dir" | fzf_project_files )

    if [[ ! "$file" = "" ]] ; then
        floaterm "$HOME/$dir/$file"
    fi
fi
