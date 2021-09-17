xnoremap <silent> <LocalLeader>ss
\   <Cmd>DB g:prod<CR>

nnoremap <silent> <LocalLeader>ss
\   m`V:DB g:prod<CR>``

nnoremap <silent><buffer> <LocalLeader>wd
\   :execute "e " . substitute(expand('%'), '/\zs\(revert\\|verify\)\ze/', 'deploy', '')<CR>

nnoremap <silent><buffer> <LocalLeader>wr
\   :execute "e " . substitute(expand('%'), '/\zs\(deploy\\|verify\)\ze/', 'revert', '')<CR>

nnoremap <silent><buffer> <LocalLeader>sr
\   :w<CR>:execute "FloatermNew cd ".expand('%:h:s?deploy\\|revert\\|verify??')." ; sqitch revert --to ".expand('%:t:r')."^"<CR>

nnoremap <silent><buffer> <LocalLeader>sd
\   :w<CR>:execute "FloatermNew cd ".expand('%:h:s?deploy\\|revert\\|verify??')." ; sqitch deploy"<CR>

