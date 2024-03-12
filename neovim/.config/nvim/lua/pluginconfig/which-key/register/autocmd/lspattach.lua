local set_keymap = function(bufnr, mode, prefix, map)
   require('which-key').register(map,
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

      set_keymap(bufnr, 'n', '<localleader>', {
         ['wl'] = {
            function()
               vim.print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            'Lsp List Worspace Folders'
         }
      })

      if client.supports_method("textDocument/formatting") then
         set_keymap(bufnr, 'n', '<localleader>', {
            ['f'] = {
               function()
                  vim.lsp.buf.format { async = false }
               end,
               'Lsp Format Code'
            }
         })
      end
      if client.supports_method "textDocument/inlayHint" then
         set_keymap(bufnr, 'n', '<localleader>', {
            ['h'] = {
               function()
                  if vim.lsp.inlay_hint.is_enabled(bufnr) then
                     vim.lsp.inlay_hint.enable(bufnr, false)
                  else
                     vim.lsp.inlay_hint.enable(bufnr, true)
                  end
               end,
               'Lsp Toggle Inlay Hint'
            }
         })
         vim.lsp.inlay_hint.enable(bufnr, true)
      end
      if client.supports_method "textDocument/hover" then
         set_keymap(bufnr, 'n', 'g', {
            h = { vim.lsp.buf.hover, 'Lsp Hover' }
         })
      end
      if client.supports_method "textDocument/signatureHelp" then
         set_keymap(bufnr, 'n', 'g', {
            ['s'] = { vim.lsp.buf.signature_help, 'Lsp Signature Help' }
         })
      end
      if client.supports_method "textDocument/rename" then
         set_keymap(bufnr, 'n', '<leader>', {
            ['er'] = { vim.lsp.buf.rename, 'Lsp Rename' }
         })
      end
      if client.supports_method "textDocument/documentSymbol" then
         set_keymap(bufnr, 'n', 'g', {
            ['0'] = { vim.lsp.buf.document_symbol, 'Lsp Document Symbols' }
         })
      end
   end,
})
