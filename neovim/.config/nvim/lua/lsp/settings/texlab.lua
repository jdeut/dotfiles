return {
   texlab = {
      auxDirectory = 'compiled',
      diagnostics = { -- recognize the `vim` global
         delay = 100
         },
      build = {
         args = { "-pdf", "-outdir=compiled", "-interaction=nonstopmode", "-synctex=1", "%f" },
         executable = "latexmk",
         isContinuous = false
      }
   }
}
