require'which-key'.register({
   i = {
      name = 'Git',
      i    = { [[<Cmd>cclose <bar> tab Git<CR>]], [[Git]] },
      w    = { [[<Cmd>Gwrite<CR>]], [[Git Write]] },
      r    = { [[<Cmd>Gread<CR>]], [[Git Checkout/Read]] },
      m    = { [[:GMove <C-r>%]], [[Git Move]], silent = false},
      d    = { [[<Cmd>GDelete<CR>]], [[Git Delete file]] },
      c    = { [[<Cmd>Git commit --quiet<CR>]], [[Git Commit]] },
      l    = { [[<Cmd>Git log<CR>]], [[Git Log]] },
      p    = { [[<Cmd>Git push<CR>]], [[Git Push]] },
      s    = { [[<Cmd>Gvdiffsplit<CR>]], [[Git Split]] },
   }
},  { mode = 'n', prefix = '<leader>' })
