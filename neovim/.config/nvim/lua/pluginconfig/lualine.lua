local function hide_on_winwidth_cond()
   if vim.fn.winwidth(0) < 80 then
      return false
   else
      return true
   end
end

local sections_common = {
    lualine_x = {
        { [[LSP]], cond = function()
                if #vim.lsp.buf_get_clients() > 0 then return true 
                else return false end
            end
        },
    },
   lualine_y = {
      {  [["Lsp"]],
         cond = function()
            if #vim.lsp.buf_get_clients() > 0 then return true 
            else return false end 
         end,
         color = { fg = '#00ff00' }
      },
      {
         function()
            return ({"⟳", "✓", "✗"})[vim.b.vimtex and vim.b.vimtex.compiler.status]
         end,
         cond = function()
            if vim.b.vimtex then
               return true
            else
               return false
            end
         end,
         type = 'lua_expr'
      },
      { [[bo:filetype]], cond = hide_on_winwidth_cond },
      { [["w" .. vim.fn.winnr() .. "b" .. vim.fn.bufnr()]], cond = hide_on_winwidth_cond},
      { [[progress]], cond = hide_on_winwidth_cond }
    },
    lualine_z = {{ [[location]] }}
}

local sections = vim.tbl_deep_extend('error', {
      lualine_a = {{ [[mode]], fmt = function(s) return s:sub(1,1) end }},
      -- b not set
      lualine_c = { function()
            return( vim.fn.expand('%:h:p:s?^.*/??') .. ' ' .. vim.fn.expand('%') )
         end
      },
      lualine_b = {{ [[branch]], cond = hide_on_winwidth_cond }}
   }, sections_common
)

local inactive_sections = vim.tbl_deep_extend('keep', {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { [[ vim.fn.expand("%") ]] }
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
      theme = 'onedark',
      component_separators = { left = [[]] , right = [[]] },
      section_separators   = { left = [[]] , right = [[]] },
      icons_enabled        = true,
   }
})
