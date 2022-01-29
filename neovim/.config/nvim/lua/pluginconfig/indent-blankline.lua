require('indent_blankline').setup {
   char = '▏',
   show_current_context = true,
   show_current_context_start = true,
   buftype_exclude = {
      'terminal',
      'help',
      'nofile',
      'quickfix'
   },
   char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
   },
}
