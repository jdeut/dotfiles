vim.wo.winhighlight = 'Normal:WhichKeyGroup'

vim.cmd([[IndentBlanklineDisable]])

vim.defer_fn( function()
      vim.wo.wrap = true
   end,
   100
)
