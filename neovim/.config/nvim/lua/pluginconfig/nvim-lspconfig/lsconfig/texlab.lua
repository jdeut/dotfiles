return {
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
         -- args = { "-shell-escape", "-pdflatex=lualatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
         args = { "-verbose", "%f" },
         executable = "latexmk",
         onSave = true,
         auxDirectory = "compiled",
         logDirectory = "compiled",
         pdfDirectory = "compiled",
         isContinuous = false
      }
   }
}
