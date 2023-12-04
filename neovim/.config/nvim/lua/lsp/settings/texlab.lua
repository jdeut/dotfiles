local setting = {
   texlab = {
      chktex = {
         onOpenAndSave = true
      },
      diagnostics = {    -- recognize the `vim` global
         delay = 100
      },
      experimental = {
         mathEnvironments = { 'align', 'align*' }
      },
      forwardSearch = {
         executable = "evince-synctex",
         args = { "-f", "%l", "%p", '"code -g %f:%l"' }
      },
      build = {
         args = { "-pdflatex=lualatex", "-outdir=compiled", "-interaction=nonstopmode", "-synctex=1", "%f" },
         onSave = true,
         executable = "latexmk",
         auxDirectory = "compiled",
         pdfDirectory = "compiled",
         isContinuous = false
      }
   }
}

return function(client)
   client.config.settings = vim.tbl_deep_extend('force', client.config.settings, setting)
   client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })

   return true
end
