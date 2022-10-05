require'which-key'.register({
   j = {
      name = 'Utils',
      t = {
         name = 'Treesitter',
         u    = { [[<Cmd>TSUpdate<CR>]], 'Update Modules'},
         n    = { [[<Cmd>TSInstallInfo<CR>]], 'List Installed Modules'},
         N    = { [[<Cmd>TSModuleInfo<CR>]], 'State of Modules'}
      }
   }
},  { mode = 'n', prefix = '<leader>' })
