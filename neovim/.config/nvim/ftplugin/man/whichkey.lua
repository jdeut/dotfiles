require'which-key'.register({
   q = { function() vim.cmd('bdel') end, 'delete buf' },
   ['<ESC>'] = { function() vim.cmd('bdel') end, 'delete buf' },
},  { mode = 'n' })
