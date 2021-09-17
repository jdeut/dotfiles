nnoremap <silent><buffer> <localleader>rr
    \ :w<cr>:call system('tmux split-window -l 80 -h "python3 ' . shellescape(@%,1) . '; echo ----------------------; echo finished; read"')<cr>
nnoremap <silent><buffer> <localleader>dd
    \ :w<cr>:call system('tmux split-window -p 60 -h "pudb3 ' . shellescape(@%,1) . '"')<cr>
