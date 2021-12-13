require'which-key'.register({
   j = {
      name = 'Utils',
      l = {
         name = 'LspInstaller',
         i    = { [[<Cmd>LspInfo<CR>]], 'Info'},
         l    = { [[<Cmd>LspInstallInfo<CR>]], 'InstallInfo'},
      }
   }
},  { mode = 'n', prefix = '<leader>' })
