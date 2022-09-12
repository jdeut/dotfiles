require'style.mytcols'

local t = {}

t.get_hl_group_colors = function (hl_gr)
   local tbl_color = {}

   local hl_id = vim.fn.hlID(hl_gr)
   local hl_id_trans = vim.fn.synIDtrans(hl_id)

   tbl_color.fg = vim.fn.synIDattr(hl_id_trans, 'fg')
   tbl_color.bg = vim.fn.synIDattr(hl_id_trans, 'bg')

   return tbl_color
end

t.highlight = function(group, color)
   local style = color.style and 'gui=' .. color.style or 'gui=NONE'
   local fg    = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
   local bg    = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
   local sp    = color.sp and 'guisp=' .. color.sp or ''

   vim.api.nvim_command(
      [[highlight ]]
      .. group .. ' ' .. style .. ' '
      .. fg .. ' ' .. bg .. ' ' .. sp
   )
end

-- t.hook = function()
--    for k, v in pairs(hlgroups) do
--       highlight(k, v)
--    end
-- end
-- local hlgroups = require'style.myhl'


-- local bcols = require'style.darknord'
-- local hlgroups = require'style.myhl'


return t
