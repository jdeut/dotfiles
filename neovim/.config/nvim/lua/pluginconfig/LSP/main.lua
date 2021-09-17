require'lspinstall'.setup()

local lua_settings = require('pluginconfig.LSP.lua-settings')
local servers      = require('lspinstall').installed_servers()


local custom_attach = function(_, bufnr)
    local function buf_map(...) 
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    buf_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { silent = true })
    buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
    buf_map("n", "'gd", "<cmd>vsplit<CR>lua vim.lsp.buf.definition()<CR>", { silent = true })
    buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
    buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true })
    buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
    buf_map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true })
    buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
    buf_map("n", "gmv", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
    --buf_map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true })
    --buf_map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { silent = true })
    --buf_map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", { silent = true })
    --buf_map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { silent = true })
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
