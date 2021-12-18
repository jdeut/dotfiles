require'which-key'.register({
   c = {
      name = '',
      c = { function() vim.cmd('Git commit --quiet') end, 'delete buf' }
   },
   ['<ESC>'] = { function() vim.fn['ftplugin#fugitive#close']() end, 'close' },
},  { mode = 'n' })
