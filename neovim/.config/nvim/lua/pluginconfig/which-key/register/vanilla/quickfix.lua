local wk = require("which-key")

wk.register({
   q = {
      name = 'Quickfix/Loclist',
      d    = {
         function()
            vim.diagnostic.setloclist()
         end, 'Show Diagnostic in Loclist'
      },
      l    = {
         function()
            local winid = vim.fn.getloclist(vim.fn.winnr(), { winid = 0 }).winid
            local cmd = winid > 0 and 'lclose' or 'lopen'
            vim.cmd(cmd)
         end, 'Toggle Loc'
      },
      q    = {
         function()
            local winid = vim.fn.getqflist({ winid = 0 }).winid
            local cmd = winid > 0 and 'cclose' or 'copen'
            vim.cmd(cmd)
         end, 'Toggle Qf'
      },
      n    = { [[<cmd>cnext<CR>]], 'next entry' },
      p    = { [[<cmd>cprev<CR>]], 'previous entry' },
      g    = {
         g = {
            function()
               vim.cmd([[copen]])
               vim.api.nvim_feedkeys('gg', 'xt', false)
               vim.cmd([[wincmd p]])
            end
            , 'gg in quickfix window'
         },
      },
      G    = {
         function()
            vim.cmd([[copen]])
            vim.api.nvim_feedkeys('G', 'xt', false)
            vim.cmd([[wincmd p]])
         end
         , 'G in quickfix window'
      },
   }
}, { mode = 'n', prefix = '<leader>' })
