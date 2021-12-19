local t = {}

t.OnVimResizeRnvimr = function()

   vim.g.rnvimr_layout.width  = math.floor( .9 * (vim.o.columns > 135 and 136 or vim.o.columns))
   vim.g.rnvimr_layout.height = math.floor( .9 * (vim.o.lines > 30 and 31 or vim.o.lines))

   local width = vim.g.rnvimr_layout.width

   vim.g.rnvimr_layout.col    = math.floor( .5 * ( vim.o.columns - width ))
   vim.g.rnvimr_layout.row    = math.floor( .1 * vim.o.lines )
end

return t
