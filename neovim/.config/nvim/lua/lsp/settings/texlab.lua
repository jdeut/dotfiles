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
      auxDirectory = 'compiled',
      chktex = {
         onOpenAndSave = true
      },
      diagnostics = { -- recognize the `vim` global
         delay = 100
      },
      build = {
         -- args = { "-pdf", "-outdir=compiled", "-interaction=nonstopmode", "-synctex=1", "%f" },
         executable = "latexmk",
         isContinuous = false
      }
   }
}

return function()
   return settings
end
