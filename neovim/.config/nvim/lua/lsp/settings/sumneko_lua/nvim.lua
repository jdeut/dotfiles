return {
   Lua = {
      diagnostics = { -- recognize the `vim` global
         globals = { 'vim' },
      },
      runtime = {
         version = 'LuaJIT'
      },
      workspace = { -- Make the server aware of Neovim runtime files
         library = {
            vim.fn.expand('$VIMRUNTIME/lua'),
            vim.fn.stdpath('config')
         }
      }
   }
}
