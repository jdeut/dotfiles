local settings_nvim = {
   Lua = {
      runtime = {
         version = "LuaJIT"
      },
      hint = {
         -- https://github.com/LuaLS/lua-language-server/wiki/Settings#hint
         enable = true,        -- inlay hints
         paramType = true,     -- Show type hints at the parameter of the function.
         paramName = "Literal", -- Show hints of parameter name (literal types only) at the function call.
         arrayIndex = "Auto",  -- Show hints only when the table is greater than 3 items, or the table is a mixed table.
         setType = true,       -- Show a hint to display the type being applied at assignment operations.
      },
      diagnostics = {
         globals = { 'use' },
         -- disable = { 'trailing-space' },
         severity = "Hint",
         neededFileStatus = {
            -- ['spell-check'] = 'Any!',
            ['codestyle-check'] = 'Any!'
         },
         workspaceDelay = 100,
         enable = true
      },
      telemetry = { -- Do not send telemetry data
         enable = false,
      },
      workspace = {
         ignoreDir = { '.git' },
         checkThirdParty = true,
         -- preloadFileSize = 150,
         library = {
            -- Make the server aware of Neovim runtime files
            vim.env.VIMRUNTIME,
            vim.fn.stdpath("config") .. "/lua"
            -- "${3rd}/luv/library"
         }
      },
      format = {
         enable = true,
         defaultConfig = {
            indent_style = "space",
            indent_size = 1,
            max_line_length = 20
         },
      }
   }
}

local settings = {
   Lua = {
      runtime = {
         version = 'Lua 5.3',
         path = {
            '?.lua',
            '?/init.lua',
            vim.fn.expand '~/.luarocks/share/lua/5.3/?.lua',
            vim.fn.expand '~/.luarocks/share/lua/5.3/?/init.lua',
            '/usr/share/5.3/?.lua',
            '/usr/share/lua/5.3/?/init.lua'
         }
      },
      workspace = {
         library = {
            vim.fn.expand '~/.luarocks/share/lua/5.3',
            '/usr/share/lua/5.3'
         }
      }
   }
}


return function(client)

   local path = {}

   if client.workspace_folders then
      path.workspace = client.workspace_folders[1].name
   else
      path.workspace = ''
   end

   -- vim.uv.fs_realpath(vim.uv.fs_readlink(vim.fn.stdpath('config')))

   path.nvim_config = vim.fn.stdpath('config')

   -- require'myhelper'.gxmessage{
   --    path.workspace,
   --    path.nvim_config
   -- }

   local regex = vim.regex("^" .. path.nvim_config)

   if regex:match_str(path.workspace) then
      -- require'myhelper'.gxmessage( "workspace folder is stdpath config" )
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, settings_nvim)
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
   elseif not vim.loop.fs_stat(path.workspace .. '/.luarc.json') and not vim.loop.fs_stat(path.workspace .. '/.luarc.jsonc') then
      -- require'myhelper'.gxmessage( "workspace folder is NOT stdpath config" )
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, settings)
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
   end

   return true
end
