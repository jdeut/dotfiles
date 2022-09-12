require'which-key'.register({
   ['<M-r>'] = { function()
         require'yabs':run_task('run')
      end, 'run'
   },
   ['<M-m>'] = { function()
         require'yabs':run_task('build')
      end, 'run'
   },
   ['<M-u>'] = { function()
         require'yabs':run_task('build_and_run')
      end, 'run'
   },
   ['<M-k>'] = { function()
         require'yabs':run_task('kill')
      end, 'run'
   },
},  { mode = 'n', prefix = '' })

