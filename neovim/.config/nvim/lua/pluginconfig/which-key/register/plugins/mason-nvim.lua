require'which-key'.register({
   j = {
      name = 'Utils',
      l    = { [[<Cmd>Mason<CR>]], 'Mason'},
      i    = { [[<Cmd>LspInfo<CR>]], 'LspInfo'},
      g    = { [[<Cmd>execute "tabnew " . luaeval("require('vim.lsp.log').get_filename()")<CR>]], 'Lsp Log' }
   }
},  { mode = 'n', prefix = '<leader>' })

