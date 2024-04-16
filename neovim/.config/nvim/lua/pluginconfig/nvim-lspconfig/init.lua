local mason_lspconfig = require 'mason-lspconfig'
local lspconfig = require 'lspconfig'

local servers = { "texlab", "lua_ls", "vala_ls" }

mason_lspconfig.setup({
   ensure_installed = servers
})

vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup('UserLspAttach', { clear = false }),
   callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client == nil then
         return
      end

      if client.supports_method "textDocument/completion" then
         vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      end
      if client.supports_method "textDocument/definition" then
         vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
      end
      if client.supports_method "textDocument/rangeFormatting" then
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

table.insert(servers, "ccls")

for _, server in pairs(servers) do
   local settings = {}

   local ok, overwrite_settings = pcall(require, 'lsp.settings.' .. server)

   if ok then
      settings = overwrite_settings
   end

   if server == 'lua_ls' then
      require("lspconfig")[server].setup {
         on_init = require('pluginconfig.nvim-lspconfig.lsconfig.' .. server),
         capabilities = capabilities
      }
   elseif server == 'ccls' then
      require("lspconfig")[server].setup {
         cmd = { "ccls", "--log-file=/tmp/ccls.log", "-v=1" },
         capabilities = capabilities,
         init_options = {
            compilationDatabaseDirectory = "build",
            index = {
               threads = 0;
            },
            clang = {
               excludeArgs = { "-frounding-math"} ;
            },
         }
      }
   else
      require("lspconfig")[server].setup {
         capabilities = capabilities,
         settings = settings
      }
   end
end
