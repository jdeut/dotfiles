local ok, hlslens = pcall(require, 'hlslens')

if not ok then return end

require('which-key').register({
   n = { function()
         vim.cmd([[normal! ]] .. vim.v.count1 .. [[n]])
         hlslens.start()
      end, 'n'
   },
   N = { function()
         vim.cmd([[normal! ]] .. vim.v.count1 .. [[N]])
         hlslens.start()
      end, 'N'
   },
   ['*'] = { [[*<Cmd>lua require('hlslens').start()<CR>]], '*' },
   ['#'] = { [[#<Cmd>lua require('hlslens').start()<CR>]], '#' },
   ['g*'] = { [[g*<Cmd>lua require('hlslens').start()<CR>]], 'g*' },
},
{ mode = 'n', silent = true, noremap = true })

