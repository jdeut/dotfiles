require'which-key'.register({
   r = {
      r = { [[<Cmd>RnvimrToggle<CR>]], 'Ranger' },
      c = { function()
            vim.fn['rnvimr#open'](vim.fn.expand('%:p:h'))
         end, 'Open Dir of Current File'
      },
      ['1'] = { function()
            vim.fn['rnvimr#open'](vim.fn.stdpath('config'))
         end, 'Open Nvim Config Dir'
      }, 'Ranger'
   }
},  { mode = 'n', prefix = '<leader>' })
