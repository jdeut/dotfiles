require'mason-lspconfig'.setup({
   ensure_installed = { "texlab", "lua_ls", "vala_ls", "clangd" }
})

local mason_lspconfig = require'mason-lspconfig'
local lspconfig = require 'lspconfig'

local common_opts = {
   capabilities = require('cmp_nvim_lsp').default_capabilities()
}

vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup('UserLspAttach', { clear = false}),
   callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client == nil then
         return
      end
      vim.notify('LspAttach autocommand ' .. client.name, vim.log.levels.INFO)
      local caps = client.server_capabilities

      require 'myhelper'.gxmessage(caps)

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

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do

   local ok, server_settings = pcall(require, 'lsp.settings.' .. server)

   if ok then
      local l_opts = vim.tbl_deep_extend("force", server_settings(), common_opts)

      lspconfig[server].setup(l_opts)
   else
      lspconfig[server].setup(common_opts)
   end
end

