local settings = {
   settings = {
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
               vim.env.VIMRUNTIME,
               vim.fn.stdpath("config") .. "/lua"
            }
         }
      }
   }
}


return function()
   -- require'myhelper'.gxmessage('sumneko_lua on_new_config')
   -- local a = config.on_attach
   -- config.on_attach = function(client, buf)
   -- end
   return settings
end
