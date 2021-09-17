"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync()

inoremap <silent><buffer> <ESC> <ESC>:wincmd c<cr>
startinsert
