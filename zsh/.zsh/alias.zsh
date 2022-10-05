alias ls='ls --color=auto --group-directories-first'
alias lg='ls -gGhrt -w30'
alias vimr='tmux select-window -t ${USER}:1 ; vim --remote'
alias less="$PAGER"
alias zless="$PAGER"
alias qmv='qmv --format=destination-only'
alias cenv_luajit='env LUA_PATH=$LUA_PATH_5_1 LUA_CPATH=$LUA_CPATH_5_1 luajit'
