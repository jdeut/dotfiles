require'which-key'.register({
   f = {
      name = 'Floaterm',
      ['<C-f>'] = { [[<Cmd>FloatermNew! cd %:p:h ; clear<CR>]], 'NewFloaterm in Cwd'},
      n         = { [[<Cmd>FloatermNew --position=top --width=81 --height=0.7<CR>]], 'NewFloaterm in Cwd'},
      i         = { require('myhelper.floaterm').toggle, 'Toggle Size'}
   }
}, {
   mode = 'n', prefix = 's'
})
