local settings = {
  -- texlab = {
  --   auxDirectory = ".",
  --   bibtexFormatter = "texlab",
  --   build = {
  --     args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
  --     executable = "latexmk",
  --     forwardSearchAfter = false,
  --     onSave = false
  --   },
  --   chktex = {
  --     onEdit = false,
  --     onOpenAndSave = false
  --   },
  --   diagnosticsDelay = 300,
  --   formatterLineLength = 80,
  --   forwardSearch = {
  --     args = {}
  --   },
  --   latexFormatter = "latexindent",
  --   latexindent = {
  --     modifyLineBreaks = false
  --   }
  -- }
   texlab = {
      chktex = {
         onOpenAndSave = true
      },
      diagnostics = { -- recognize the `vim` global
         delay = 100
      },
      experimental = {
         mathEnvironments = {'align', 'align*'}
      },
      forwardSearch = {
         executable = "evince-synctex",
         args = { "-f", "%l", "%p", '"code -g %f:%l"' }
      },
      build = {
         -- args = { "-pdf", "-outdir=compiled", "-interaction=nonstopmode", "-synctex=1", "%f" },
         executable = "latexmk",
         auxDirectory = "compiled",
         pdfDirectory = "compiled",
         isContinuous = false
      }
   }
}

return function()
   return settings
end
