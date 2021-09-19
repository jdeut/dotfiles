
require('lualine').setup({
    options = {
       component_separators = { left = [[]] , right = [[]] },
        section_separators = { left = [[]] , right = [[]] },
        icons_enabled = true
    },
    sections = {
        lualine_a = { [[mode]] },
        lualine_b = { [[branch]] },
        lualine_c = { [[vim.fn.expand("%")]] },
        lualine_x = { [[encoding]] , [[filetype]] },
        lualine_y = { [["Win" .. vim.fn.winnr()]], [["Buf" .. vim.fn.bufnr()]], [[progress]] },
        lualine_z = { [[location]] }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { [[vim.fn.expand("%")]] },
        lualine_x = { [[location]] },
        lualine_y = { [["Win" .. vim.fn.winnr()]], [["Buf" .. vim.fn.bufnr()]], [[progress]] },
        lualine_z = {}
    }
})
    --}
--}
