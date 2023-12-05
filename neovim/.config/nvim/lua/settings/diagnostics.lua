local diagnostic_format = function(diagnostic)
   return string.format("%.5s: %s", diagnostic.source, diagnostic.message)
end

vim.diagnostic.config {
   -- disable virtual text
   virtual_text = {
      prefix = '●',
      format = diagnostic_format,
      spacing = 13
   },
   -- show signs
   signs = true,
   -- signs = {
   --    active = signs,
   -- },
   update_in_insert = true,
   underline = true,
   severity_sort = true,
   float = {
      focusable = false,
      style = "minimal",
      anchor = "NW",
      fixed = 'true',
      border = "double",
      source = "always",
      header = "",
      prefix = "",
   },
}

local signs = {
   DiagnosticSignError = 'E',
   DiagnosticSignHint  = 'H',
   DiagnosticSignInfo  = 'I',
   DiagnosticSignWarn  = 'W'
}

-- for name, text in pairs(signs) do
--    vim.fn.sign_define(name,  {text = text, texthl = name})
-- end

-- local orig_signs_handler = vim.diagnostic.handlers.signs
--
-- -- Override the built-in signs handler
-- vim.diagnostic.handlers.signs = {
--    show = function(ns, bufnr, _, opts)
--       -- Get all diagnostics from the whole buffer rather than just the
--       -- diagnostics passed to the handler
--       local diagnostics = vim.diagnostic.get(bufnr)
--
--       -- Find the "worst" diagnostic per line
--       -- local max_severity_per_line = {}
--       -- for _, d in pairs(diagnostics) do
--       --    local m = max_severity_per_line[d.lnum]
--       --    if not m or d.severity < m.severity then
--       --       max_severity_per_line[d.lnum] = d
--       --    end
--       -- end
--
--       -- Pass the filtered diagnostics (with our custom namespace) to
--       -- the original handler
--       -- local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
--
--       orig_signs_handler.show(ns, bufnr, diagnostics, opts)
--    end,
--    hide = function(ns, bufnr)
--       orig_signs_handler.hide(ns, bufnr)
--    end,
-- }
