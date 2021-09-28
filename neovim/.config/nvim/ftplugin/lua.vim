lua require('ftplugin.lua')

setlocal tabstop=4

set foldlevelstart=2
set foldlevel=2
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldenable

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
"\           .. str .. :
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

