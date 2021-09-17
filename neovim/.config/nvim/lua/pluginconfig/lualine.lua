
require('lualine').setup({
    options = {
        component_separators = { [[]] , [[]] },
        section_separators = { [[]] , [[]] },
        icons_enabled = 1,
        padding = 1,
        left_padding = 1
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
