require'which-key'.register( {
   c = {
      name = 'Comment',
      c    = { [[<plug>kommentary_line_default]],  [[Toggle Commi]] }
   }
},  { mode = 'n', prefix = '<leader>' })

require'which-key'.register( {
   c = {
      name = 'Comment',
      c    = { [[<plug>kommentary_visual_default<C-c>]],  [[Toggle Commi]] }
   }
},  { mode = 'v', prefix = '<leader>' })
