local set_keymap = function(bufnr, mode, prefix, map)
   require('which-key').register(map,
      { mode = mode, buffer = bufnr, prefix = prefix }
   )
end

vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup('UserLspAttachKeymapsTexLab', { clear = false }),
   callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client.name ~= 'texlab' then
         return
      end

      set_keymap(bufnr, 'n', '<localleader>', {

         b = {
            function()
               vim.cmd([[TexlabBuild]])
            end, 'TexlabBuild' }
      })
      set_keymap(bufnr, 'n', '<localleader>', {
         a = {
            function()
               vim.cmd([[TexlabForward]])
            end, 'TexlabForward' }
      })
   end,
})
