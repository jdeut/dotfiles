require'which-key'.register({
   j = {
      name = 'Utils',
      g = {
         name = 'Gutentags',
         g    = { [[:GutentagsUpdate<CR>]], [[Update]] }
      }
   }
},  { mode = 'n', prefix = '<leader>' })
