local settings = {
   Lua = {
      diagnostics = {
         globals = {'use'},
         enable = true
      },
      telemetry = { -- Do not send telemetry data
         enable = false,
      },
      workspace = {
         ignoreDir = {'.git'},
         checkThirdParty = true,
         preloadFileSize = 150,
         library = {
         -- Make the server aware of Neovim runtime files
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
         }
      }
   }
}

-- cnf.on_new_config = function(new_config, root)
--    local fn = require'lsp.settings.sumneko_lua.other'
--
--    if root == '/home/johannes/.dotfiles' then
--       fn = require'lsp.settings.sumneko_lua.nvim'
--    end
--
--    local ok, c = pcall(fn)
--
--    if ok then
--       new_config = vim.tbl_extend('force', new_config, c)
--    end
--
--    local ok, c = pcall(new_config.notify, "workspace/didChangeConfiguration")
--
--    -- require'myhelper'.gxmessage({new_config = new_config, root = root, ok = ok, c = c})
-- end
--
-- cnf.before_init = function(_, config)
--    -- require'myhelper'.gxmessage(vim.inspect(config))
--    local fn = require'lsp.settings.sumneko_lua.other'
--
--    if config.root_dir == '/home/johannes/.dotfiles' then
--       fn = require'lsp.settings.sumneko_lua.nvim'
--    end
--
--    local ok, c = pcall(fn)
--
--    if ok then
--       config = vim.tbl_extend('force', config, c)
--    end
--    -- require'myhelper'.gxmessage('okimoki')
--
--    local ok, c = pcall(config.notify, "workspace/didChangeConfiguration")
--
--    -- require'myhelper'.gxmessage({new_config = config})
-- end


return function()
   -- require'myhelper'.gxmessage('sumneko_lua on_new_config')
   -- local a = config.on_attach
   -- config.on_attach = function(client, buf)
   -- end
   return settings
end
