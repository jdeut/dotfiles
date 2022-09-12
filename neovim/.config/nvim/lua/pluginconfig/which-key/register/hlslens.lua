require('which-key').register({
   n = { function()
         vim.cmd([[normal! ]] .. vim.v.count1 .. [[n]])
         require'hlslens'.start()
      end, 'n'
   },
   N = { function()
         vim.cmd([[normal! ]] .. vim.v.count1 .. [[N]])
         require'hlslens'.start()
      end, 'N'
   }
},
{ mode = 'n', silent = true, noremap = true })

