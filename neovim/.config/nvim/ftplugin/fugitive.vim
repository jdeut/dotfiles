setlocal cursorline

noremap <silent><buffer> <ESC> <ESC>:call ftplugin#fugitive#close()<CR>
nnoremap <buffer> <silent> cc <Cmd>Git commit --quiet<CR>
