require'which-key'.register({
   ['<F12>'] = { function()
         local ret = require'myhelper'.get_last_visual_selection()
         require'myhelper'.gxmessage(ret)
      end,  [[Get Visual Selection]]
   }
},  { mode = 'v', prefix = '' })
