require'mason-lspconfig'.setup({
   ensure_installed = { "texlab", "lua_ls", "vala_ls", "clangd" }
})

local mason_lspconfig = require'mason-lspconfig'
local lspconfig = require 'lspconfig'

local common_opts = {
   on_attach = require 'lsp.on_attach',
   capabilities = require('cmp_nvim_lsp').default_capabilities()
}

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
   -- print(server)
   -- require'myhelper'.gxmessage(server)

   local ok, server_settings = pcall(require, 'lsp.settings.' .. server)

   if ok then
      local l_opts = vim.tbl_deep_extend("force", server_settings(), common_opts)

      lspconfig[server].setup(l_opts)
   else
      lspconfig[server].setup(common_opts)
   end
end
