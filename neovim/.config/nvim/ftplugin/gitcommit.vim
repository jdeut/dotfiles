"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync()

inoremap <silent><buffer> <CR> <ESC>:w<cr>:wincmd c<cr>
startinsert
