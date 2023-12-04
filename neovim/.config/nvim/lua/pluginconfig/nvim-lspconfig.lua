local mason_lspconfig = require 'mason-lspconfig'
local lspconfig = require 'lspconfig'

mason_lspconfig.setup({
   ensure_installed = { "texlab", "lua_ls", "vala_ls", "clangd" }
})

vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup('UserLspAttach', { clear = false }),
   callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client == nil then
         return
      end
      -- vim.notify('LspAttach autocommand ' .. client.name, vim.log.levels.INFO)
      local caps = client.server_capabilities

      if caps.completionProvider then
         vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      end
      if caps.definitionProvider then
         vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
      end
      if caps.documentRangeFormattingProvider then
         vim.bo[bufnr].formatexpr = 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})'
      end
   end,
})

local capabilities = vim.tbl_deep_extend(
   "force",
   vim.lsp.protocol.make_client_capabilities(),
   require('cmp_nvim_lsp').default_capabilities()
)

vim.lsp.set_log_level('info')

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do

   local ok, on_init = pcall(require, 'lsp.settings.' .. server)

   if ok then
      lspconfig[server].setup {
         capabilities = capabilities,
         on_init = on_init
      }
   else
      lspconfig[server].setup {
         capabilities = capabilities
      }
   end
end
