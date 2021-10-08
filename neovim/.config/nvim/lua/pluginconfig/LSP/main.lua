require'lspinstall'.setup()

local lua_settings = require('pluginconfig.LSP.lua-settings')
local servers      = require('lspinstall').installed_servers()


local custom_attach = function(_, bufnr)
    local function buf_map(...) 
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

for _, server in pairs(servers) do
    local config = {
        on_attach = custom_attach
    }

    if server == "lua" then
        config.settings = lua_settings
    end

    require'lspconfig'[server].setup(config)
end
