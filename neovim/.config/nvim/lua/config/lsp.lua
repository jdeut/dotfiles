vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
   vim.lsp.handlers.hover, {
      -- Use a sharp border with `FloatBorder` highlights
      border = "single"
   }
)
