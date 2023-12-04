local set_keymap = function(bufnr, mode, prefix, map)
   require('which-key').register( map,
      { mode = mode, buffer = bufnr, prefix = prefix }
   )
end


vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup('UserLspAttachKeymaps', { clear = false }),
   callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client == nil then
         return
      end

      local caps = client.server_capabilities

      if caps.hoverProvider then
         set_keymap(bufnr, 'n', 'g', {
            h = { vim.lsp.buf.hover, 'Lsp Hover' }
         })
      end
      if caps.documentSymbolProvider then
         set_keymap(bufnr, 'n', 'g', {
            ['0'] = { vim.lsp.buf.document_symbol, 'Lsp Document Symbols' }
         })
      end
   end,
})
