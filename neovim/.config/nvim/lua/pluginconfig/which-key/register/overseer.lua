require'which-key'.register({
   ['<M-o>'] = { function()
         vim.cmd([[OverseerRun]])
      end, 'run'
   }
},  { mode = 'n', prefix = '' })

