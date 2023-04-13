vim.wo.winhighlight = 'Normal:WhichKeyGroup'

if vim.fn.exists(':IndentBlanklineDisable') > 0 then
   vim.cmd([[IndentBlanklineDisable]])
end

vim.defer_fn( function()
      vim.wo.wrap = true
   end,
   100
)
