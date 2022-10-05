require'which-key'.register({
   j = {
      name = 'Utils',
      l    = { [[<Cmd>Mason<CR>]], 'Mason'},
      i    = { [[<Cmd>LspInfo<CR>]], 'LspInfo'}
   }
},  { mode = 'n', prefix = '<leader>' })

