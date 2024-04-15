require 'which-key'.register({
   ["u"] = {
      name = "Debug",
      b = {
         name = "Breakpoints",
         c = {
            "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            "Breakpoint Condition",
         },
         m = {
            "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
            "Log Point Message",
         },
         t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Create" },
      },
      h = {
         name = "Hover",
         h = { "<cmd>lua require('dap.ui.variables').hover()<CR>", "Hover" },
         v = { "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", "Visual Hover" },
      },
      r = {
         name = "Repl",
         o = { "<cmd>lua require('dap').repl.toggle()<CR>", "Toggle" },
         l = { "<cmd>lua require('dap').repl.run_last()<CR>", "Run Last" },
      },
      R = {
         "<cmd>lua require('dap').run_to_cursor()<CR>",
         "Run to cursor",
      },
      s = {
         name = "Step",
         c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
         v = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
         i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
         o = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
      },
      t = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle" },
      u = {
         name = "UI",
         h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
         f = {
            "local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
            "Float",
         },
      },
   },
   ['<M-o>'] = { function()
      vim.cmd([[OverseerRun]])
   end, 'run'
   }
}, { mode = 'n', prefix = [[<leader>]] })
