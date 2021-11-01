source <sfile>:p:h/r.vim

"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync()

hi link rnowebDelimiter MyRnowebDelimiter

let g:vimtex_mappings_enabled = 0
