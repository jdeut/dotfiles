require'which-key'.register({
   name = 'Utils',
   p = {
      name = 'Packer',
      u    = { [[<Cmd>PackerUpdate<CR>]], 'Update'},
      s    = { [[<Cmd>PackerStatus<CR>]], 'Status'},
      i    = { [[<Cmd>PackerInstall<CR>]], 'Install'}
   }
},  { mode = 'n', prefix = [[<leader>j]] })
