require'which-key'.register({
   c = {
      name = '',
      c = { function() vim.cmd('Git commit --quiet') end, 'delete buf' }
   },
   ['<ESC>'] = { function() vim.cmd([[hide]]) end, 'close' },
},  { buffer = 0, mode = 'n' })
