local c = {
   settings = {
      Lua = {
         diagnostics = {
            globals = {
               'it',
               'setup',
               'describe',
               'require',
               'use',
               'love'
            }
         },
         runtime = {
            version = "Lua 5.3",
            path    = vim.split(os.getenv('LUA_PATH_5_3'), ';')
         },
         workspace = {
            library = {
               vim.fn.expand('~/.luarocks/share/lua/5.3'),
               '/usr/share/lua/5.3'
            },
         }
      }
   }
}

return function()
   return c
end
