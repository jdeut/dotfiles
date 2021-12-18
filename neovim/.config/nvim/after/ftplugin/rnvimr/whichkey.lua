require'which-key'.register({
   q = { function() vim.cmd('RnvimrToggle') end, 'Toggle' },
   ['<ESC>'] = { function() vim.cmd('RnvimrToggle') end, 'Toggle' },
},  { buffer = 0, mode = 't' })
