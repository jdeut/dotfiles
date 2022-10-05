local set_keymap = function(bufnr, mode, prefix, map)
   require('which-key').register(
      map,
      { mode = mode, buffer = bufnr, prefix = prefix }
   )
end

-- n = { vim.lsp.diagnostic.goto_next, 'next error'},
-- N = { vim.lsp.diagnostic.goto_prev, 'prev error'},
-- i = { vim.lsp.buf.implementation, 'code action'},
-- d = { vim.lsp.buf.definition, 'go to definition'},
-- D = { vim.lsp.buf.declaration, 'go to definition'},
-- h = { vim.lsp.buf.hover, 'hover'},
-- r = { vim.lsp.buf.references, 'references'},
-- s = { vim.lsp.buf.rename, 'rename'},
--
local buf_set_option = function(bufnr, ...)
   vim.api.nvim_buf_set_option(bufnr, ...)
end

local caps = {
   definitionProvider = function(bufnr)
      buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
   end,
   renameProvider = function(bufnr)
      set_keymap(bufnr, 'n', '<leader>', {
         e = { r = { vim.lsp.buf.rename, 'Lsp Rename' } }
      })
   end,
   hoverProvider = function(bufnr)
      set_keymap(bufnr, 'n', 'g', {
         h = { vim.lsp.buf.hover, 'Lsp Hover' }
      })
   end,
   documentSymbolProvider = function(bufnr)
      set_keymap(bufnr, 'n', 'g', {
         ['0'] = { vim.lsp.buf.document_symbol, 'Lsp Document Symbols' }
      })
   end,
   documentFormattingProvider = function(_)
      -- vim.cmd(
      --    [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
      -- )
   end,
   documentRangeFormattingProvider = function(bufnr)
      buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})')
   end
}

local on_attach = function(client, bufnr)
   -- require 'myhelper'.gxmessage(client.server_capabilities)
   --

   buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   for cap, action in pairs(caps) do
      if client.server_capabilities[cap] then
         action(bufnr)
      end
   end
   -- if client.name == 'texlab' then
   --    return
   -- end

   -- client.notify("workspace/didChangeConfiguration")
end

return on_attach
