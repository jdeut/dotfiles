require'which-key'.register({
   j = {
      name = 'Utils',
      u = {
         name = 'UltiSnips',
         s    = { [[:UltiSnipsEdit<CR>]], [[Edit]]}
      }
   }
},  { mode = 'n', prefix = '<leader>' })
