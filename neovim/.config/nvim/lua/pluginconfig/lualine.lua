local function hide_on_winwidth_cond()
   if vim.fn.winwidth(0) < 80 then
      return false
   else 
      return true 
   end 
end

local sections_common = {
    lualine_c = { [[vim.fn.expand("%")]] },
    lualine_x = { },
    lualine_y = {{
       [[encoding]] , [[filetype]], 
       [["w" .. vim.fn.winnr() .. "b" .. vim.fn.bufnr()]] , [[progress]],
       cond = hide_on_winwidth_cond
    }},
    lualine_z = {{
       [[location]],
       cond = hide_on_winwidth_cond
    }}
}

local sections = vim.tbl_deep_extend('error', {
      lualine_a = {{[[mode]], fmt = function(s) return s:sub(1,1) end }},
      lualine_b = {{[[branch]], cond = hide_on_winwidth_cond }}
   }, sections_common
)

local inactive_sections = vim.tbl_deep_extend('keep', {
      lualine_a = {},
      lualine_b = {},
   }, sections_common
)

require('lualine').setup({
    sections          = sections,
    inactive_sections = inactive_sections,
    extensions = {
       'quickfix', 'fzf',
       'fugitive', 'toggleterm'
    },
    options = {
       component_separators = { left = [[]] , right = [[]] },
       section_separators   = { left = [[]] , right = [[]] },
       icons_enabled        = true,
    }
})
