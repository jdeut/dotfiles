return {
    Lua = {
        runtime = {
            -- LuaJIT in the case of Neovim
            version = 'Lua 5.3',
            path = vim.split(package.path, ';'),
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
            enable = false
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
        },      -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
        window = {
            statusBar = false
        }
    }
}
