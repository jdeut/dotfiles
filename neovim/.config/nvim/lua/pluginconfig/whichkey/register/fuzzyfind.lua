wk = require("which-key")

wk.register({
   name = 'Hop',

   ['1'] = { function()
         require'pluginconfig.fzf-lua'.custom.git_files({
            cwd = [[/home/johannes/.dotfiles/neovim/.config/nvim]]
         })
      end, 
      [[Nvim Config Dir]]
   },
   ['2'] = { function()
         require'pluginconfig.fzf-lua'.custom.git_files({
            cwd = [[/home/johannes/.dotfiles]]
         })
      end, 
      [[Dotfiles]]
   },

   ["<leader>"] = {

      name = 'Fzf',

      ['8'] = { function()
            local m = require'fzf-lua.path'
            local path = vim.fn.expand('%:p:h')
            local cwd = m.git_root(path, 0)

            if not cwd then
               cwd = path
            end

            require "fzf-lua".grep_cword({
               cwd = cwd
            })
         end, [[Grep Ftype]]
      },

      ['/'] = { function()
            local m = require'fzf-lua.path'
            local path = vim.fn.expand('%:p:h')
            local cwd = m.git_root(path, 0)

            if not cwd then
               cwd = path
            end

            require "fzf-lua".grep({
               cwd = cwd
            })
         end, [[Grep Ftype]]
      },

      ['<C-_>'] = { function()
            require'fzf-lua'.grep({
               continue_last_search = true
            })
         end, [[Grep Ftype]]
      },

      ['/'] = { function()
            local m = require'fzf-lua.path'
            local path = vim.fn.expand('%:p:h')
            local cwd = m.git_root(path, 0)

            if not cwd then
               cwd = path
            end

            require "fzf-lua".live_grep({
               cwd = cwd
            })
         end, [[Grep Ftype]]
      },

      ['?'] = { function()
            require "fzf-lua".live_grep_resume({ })
         end, [[Grep Ftype]]
      },

      f = { require'fzf-lua'.buffers,  [[Buffers]] },

      ['<C-f>'] = { function()
            require'fzf-lua'.buffers({
               cwd_only = true
            })
         end,
         [[Buffers (Cwd Only)]]
      },

      h = { function()
            require'fzf-lua'.help_tags({
               fzf_opts = {
                  ['--tiebreak'] = 'begin'
               }
            })
         end, [[Help]]
      },

      a = { function()
            require'pluginconfig.fzf-lua'.custom.git_files{ }
         end, [[Git Files]]
      },

      n = { function() 
            require'fzf-lua'.oldfiles{
               fzf_opts = {
                  ['--tiebreak'] = 'begin,end'
               }
            } end, [[Oldfiles]]
         },
      }
},  {
   mode = "n", prefix = "<leader>", buffer = nil, silent = false, noremap = true
})
