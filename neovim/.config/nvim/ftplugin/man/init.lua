vim.wo.winhighlight = 'Normal:Floaterm'


if vim.fn.exists(':IndentBlanklineDisable') > 0 then
   vim.cmd([[IndentBlanklineDisable]])
end
