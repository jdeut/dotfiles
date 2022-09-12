require'which-key'.register({
   j = {
      name = 'Utils',
      p = {
         name = 'Packer',
         u    = { [[<Cmd>PackerUpdate<CR>]], 'Update'},
         s    = { [[<Cmd>PackerStatus<CR>]], 'Status'},
         i    = { [[<Cmd>PackerInstall<CR>]], 'Install'}
      }
   }
},  { mode = 'n', prefix = '<leader>' })
