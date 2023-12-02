require'which-key'.register({
   j = {
      name = 'Utils',
      u = {
         name = 'UltiSnips',
         s    = { [[:UltiSnipsEdit<CR>]], [[Edit]]}
      }
   }
},  { mode = 'n', prefix = '<leader>' })

-- require'which-key'.register({
--    ['<C-f>'] = { function()
--          print('test')
--          vim.fn['UltiSnips#ExpandSnippet']()
--       end, 'ExpandSnippet'
--    }
-- },  { mode = 'v', prefix = '' })
