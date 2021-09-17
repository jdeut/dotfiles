lua require('ftplugin.lua')

setlocal tabstop=3

"autocmd BufRead,BufNewFile *.lua
"\   lua
"\   if string.match(vim.fn.expand('<afile>:p'), '/%.config/nvim/.*%.lua$')
"\   then 
"\       local str = vim.fn.expand('%:s?^lua/??:s?\\.lua$??')
"\       vim.api.nvim_buf_set_keymap(
"\           0,
"\           'n',
"\           '<LocalLeader>re',
"\           [[<Cmd>lua require('plenary.reload').reload_module(']] 
"\           .. str .. 
"\           [[') print("reload...")<CR>]],
"\           { noremap = true }
"\       )
"\       vim.api.nvim_buf_set_keymap(
"\           0,
"\           'n',
"\           '<LocalLeader>tm',
"\           [[:w<cr><LocalLeader>re:lua require(']] 
"\           .. str .. 
"\           [[').]],
"\           { }
"\       )
"\   end

nnoremap <silent><buffer> <LocalLeader>rl
\   <Cmd>w <bar> FloatermNew --autoclose=0 --position=bottomright --width=80 --height=0.8 love %:h<cr>
nnoremap <silent><buffer> <LocalLeader>gl
\   <Cmd>execute "OpenBrowserSmartSearch -loveapiref ".expand("<cword>")<cr>
nnoremap <silent><buffer> <LocalLeader>hl
\   <Cmd>execute "help love-".substitute(expand("<cWORD>"), "(.*$", "", "") <bar>
\   wincmd L<cr>

