require'which-key'.register( {
   ['<C-Space>'] = { function()
         vim.cmd([[wincmd p]])

         if vim.bo.buftype == 'terminal' then
               vim.cmd([[stopinsert]])
               vim.cmd([[normal i]])
         end
      end,  [[Go to previous window]]
   },
},  { mode = 'i' })
