local t = {} 

t.winwidth_ge = function(n)
   return function()
      if vim.fn.winwidth(0) > n then return true
      else return false end
   end
end

t.lsp_clients = function()
   if #vim.lsp.buf_get_clients() > 0 then return true
   else return false end
end

local sect_active = {
   lualine_a = { { [[mode]], fmt = function(s) return s:sub(1, 1) end } },
   lualine_b = { { [[branch]], cond = t.winwidth_ge(120) } },
   lualine_c = { function() return vim.fn.expand("%") end },
   lualine_x = {
      {
         [[LSP]], cond = t.winwidth_ge(80)
      },
   },
   lualine_y = {
      {
         [["Lsp"]],
         cond = function()
            if not t.winwidth_ge(80) then return false end
            return t.lsp_clients()
         end,
         color = { fg = '#00ff00' }
      },
      {
         function()
            return ({ "⟳", "✓", "✗" })[vim.b.vimtex and vim.b.vimtex.compiler.status]
         end,
         cond = function()
            if vim.b.vimtex then return true
            else return false
            end
         end,
         type = 'lua_expr'
      },
      { [[bo:filetype]], cond = t.winwidth_ge(80) },
      { [["w" .. vim.fn.winnr() .. "b" .. vim.fn.bufnr()]], cond = t.winwidth_ge(100) },
      { [[progress]], cond = t.winwidth_ge(90) }
   },
   lualine_z = { { [[location]], cond = t.winwidth_ge(40) } }
}

local sect_inactive = vim.tbl_deep_extend(
   'keep',
   { lualine_a = {}, lualine_b = {} },
   sect_active
)

require('lualine').setup({
   sections          = sect_active,
   inactive_sections = sect_inactive,
   extensions        = {
      'quickfix',
      'fzf',
      'fugitive',
      'toggleterm'
   },
   options           = {
      theme                = 'onedark',
      always_divide_middle = true,
      component_separators = { left = [[]], right = [[]] },
      section_separators   = { left = [[]], right = [[]] },
      icons_enabled        = true,
   }
})
