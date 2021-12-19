require'which-key'.register({
   ['<C-q>'] = { function() vim.cmd('RnvimrToggle') end, 'Toggle' },
   ['<C-ESC>'] = { function() vim.cmd('RnvimrToggle') end, 'Toggle' },
},  { buffer = 0, mode = 't' })
