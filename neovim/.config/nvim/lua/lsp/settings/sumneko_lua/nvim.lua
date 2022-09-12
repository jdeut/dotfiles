local c = {
   settings = {
      Lua = {
         diagnostics = {
            globals = { 'use', 'vim' }
         },
         runtime = {
            version = "LuJIT",
            path = vim.split(package.path, ';'),
         },
         workspace = {
            library = {
               [vim.fn.expand('$VIMRUNTIME/lua')] = true,
               [vim.fn.stdpath('config')] = true
            }
         }
      }
   }
}

return function()
   return c
end
