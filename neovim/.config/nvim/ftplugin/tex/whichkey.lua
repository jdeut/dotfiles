local function tex_logfilename()
   local state = vim.fn['vimtex#state#get'](vim.b.vimtex_id)
   local build_dir = state.compiler.build_dir

   local path = vim.fn.expand('%:.:h')
   local basefilename = vim.fn.expand('%:t:r')

   local logfile = string.format(
      [[%s/%s/%s.log]],
      path, build_dir, basefilename
   )

   assert(
      vim.fn.filereadable(logfile) == 1,
      string.format(
         [[Try to open logfile: '%s' does not exist]],
         logfile
      )
   )

   return logfile
end

local mappings = {
   k = {[[:VimtexDocPackage<CR>]], 'vimtex-info-full'},
   t = { function()
         vim.cmd('VimtexToggleMain')
      end,
      'VimtexToggleMain'
   },
   ['<F6>'] = {
      function()
         require('plenary.job'):new({command = 'gxmessage', args = { 'test' } }):sync()
      end,
      'test'
   },
   e = {
      name = 'VimtexInfo',
      i = {[[<plug>(vimtex-info-full)]], 'vimtex-info-full'},
      m = {[[<plug>(vimtex-toggle-main)]], 'vimtex-toggle-main'}
   },
   w = {
      name = 'browser',
      d = {function()
            input = vim.fn.input('PackageName: ')
            vim.cmd([[VimtexDocPackage ]] .. input)
         end,
         'VimtexDocPackage'
      },
      t = {[[<Cmd>execute "OpenBrowserSmartSearch -tex ".expand('<cword>')<CR>]], 'tex'},
      f = { function()
            local head = vim.fn.expand('%:.:h')
            local cfile = vim.fn.expand('<cfile>')
            vim.cmd("tabnew " .. head .. '/' .. cfile)
         end,
         'create file rel. to filepath'
      }
   },
   l = {
      name = 'Build related',
      l = {[[:w<cr>:VimtexCompile<cr>]], 'Compile'},
      g = { function()
            vim.cmd(
               [[botright vsplit ]] .. 
               tex_logfilename()
            )
         end, 'Open Log'
      },
      G = { function()
         vim.cmd(
            [[tabnew ]] .. 
            tex_logfilename()
            )
         end, 'Open Log'
      }
   },
   r = {
      name = 'Run related',
      -- l = {[[:w<cr>:VimtexCompile<cr>]], 'Compile'},
      b = { function()
         require('plenary.job'):new({
            command = 'zathura',
            args = { [[--fork]],
               vim.fn.expand('%:h') .. [[/]] .. 
               vim.b.ftype_tex_build_dir .. [[/]] .. 
               vim.fn.expand('%:t:r') .. [[.pdf]],
            }
         }):sync()
      end, 'open'
      },
      r = {[[:w<cr>:VimtexCompile<cr>]], 'Compile'}
   },
   v = { function()
         vim.cmd([[VimtexView]])
      end, 'Compile'
   },
   V = { function()
         -- vim.cmd([[VimtexView]])
         vim.fn.jobstart({'run-raise-bridge.sh', 'okular' }, { detach = 1 })
      end, 'Compile'
   },
}

require('which-key').register(
   mappings, {
      buffer = 0,
      prefix = '<localleader>'
   }
)
