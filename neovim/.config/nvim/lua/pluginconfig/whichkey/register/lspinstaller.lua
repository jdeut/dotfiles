require'which-key'.register({
   j = {
      name = 'Utils',
      l = {
         name = 'LspInstaller',
         n    = { [[<Cmd>LspInfo<CR>]], 'Info'},
         l    = { [[<Cmd>LspInstallInfo<CR>]], 'InstallInfo'},
         g    = { function()
               print(vim.lsp.get_log_path())
            end, 'InstallInfo'
         },
      }
   }
},  { mode = 'n', prefix = '<leader>' })

