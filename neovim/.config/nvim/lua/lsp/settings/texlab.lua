local setting = {
   texlab = {
      latexindent = {
         ["local"] = vim.fs.joinpath(vim.env.HOME, '.latexindent.yaml')
      },
      chktex = {
         onOpenAndSave = true,
         onEdit = true
      },
      diagnostics = { -- recognize the `vim` global
         delay = 10,
         ignoredPatterns = {
            "Wrong length of dash may have been used.",
            "You should put a space",
            "Package typearea Warning",
            "Command terminated with space"
         }
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
         executable = "latexmk",
         onSave = true,
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
