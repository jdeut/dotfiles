require('ibl').setup {
   indent = {
      char = '▏',
      highlight = {
         "IndentBlanklineIndent1",
         "IndentBlanklineIndent2",
         "IndentBlanklineIndent3",
         "IndentBlanklineIndent4",
         "IndentBlanklineIndent5",
         "IndentBlanklineIndent6"
      }
   },
   exclude = {
      buftypes = {
         'terminal',
         'help',
         'nofile',
         'quickfix'
      }
   }
}

