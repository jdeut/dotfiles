"call jobstart('gxmessage "asdasd"')
"lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 

" source <sfile>:p:h/denite-common.vim

setlocal list
setlocal winblend=20
"setlocal signcolumn=no
"
lua require('gitsigns').detach()

if bufname("%") == '[denite]-ttfiles'
    noremap <silent><buffer><expr> gt
    \   denite#do_map('do_action', 'runtestthatcase')
    noremap <silent><buffer><expr> gv
    \   denite#do_map('do_action', 'run-manage-cases')
endif

if bufname("%") =~ '.*files$'
    "syn match Error +\/\zs[a-zA-Z0-9.]*\ze\/+
    "echo 'xxx'
    call matchadd('DenitePathTail', '\(^.\{-}\)\zs[^/]*$')
    call matchadd('DenitePathHead', '.*\([^/]*$\)\@!')
endif

setlocal winhighlight="SignColumn:DeniteSignColumn"

nnoremap <silent><buffer> m
\   <Cmd>call denite#call_map('choose_action')<cr>

nnoremap <silent><buffer> <CR>
\   <Cmd>call denite#call_map('do_action')<cr>

nnoremap <silent><buffer> <C-c>
\   <Cmd>bd<cr>
nnoremap <silent><buffer> <Esc>
\   <Cmd>bd<cr>
