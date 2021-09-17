setlocal cursorline

noremap <silent><buffer> <ESC> <ESC>:call ftplugin#fugitive#close()<CR>
nnoremap <buffer> <silent> cc :silent Git commit --quiet<CR>
