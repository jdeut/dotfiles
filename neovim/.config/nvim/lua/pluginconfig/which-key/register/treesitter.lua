require'which-key'.register({
   j = {
      name = 'Utils',
      t = {
         name = 'Treesitter',
         u    = { [[<Cmd>TSUpdate<CR>]], 'Info'},
         n    = { [[<Cmd>TSInstallInfo<CR>]], 'Info'},
         N    = { [[<Cmd>TSModuleInfo<CR>]], 'Module Info'}
      }
   }
},  { mode = 'n', prefix = '<leader>' })
