local wk = require'which-key'
local FzfLua = require'fzf-lua'
local h = require'myhelper'

local t = {
   git_files = function(path)
      return function()
         require'pluginconfig.fzf-lua'.custom.git_files({ cwd = path })
      end
   end
}

wk.register({
   name = 'Hop',

   ['1'] = { t.git_files('/home/johannes/.dotfiles/neovim/.config/nvim'), [[Nvim Config Dir]] },
   ['2'] = { t.git_files('/home/johannes/.dotfiles'), [[Dotfiles]] },

   ["<leader>"] = {
      name = 'Fzf',
      f = { FzfLua.buffers,  [[Buffers]] },
      n = { FzfLua.oldfiles, [[Oldfiles]] },
      h = { FzfLua.help_tags , [[Help]] },
      m = { FzfLua.man_pages , [[Help]] },
      a = { require'pluginconfig.fzf-lua'.custom.git_files , [[Git Files]] },
      ['?'] = { function()
            FzfLua.live_grep_resume({ cwd = h.git_get_root_or_cwd() })
            end, [[Grep Ftype Resume]]
      },
      ['8'] = { function()
            FzfLua.grep_cword({ cwd = h.git_get_root_or_cwd() })
         end, [[Grep Ftype Cword]]
      },
      ['/'] = { function()
            FzfLua.live_grep({ cwd = h.git_get_root_or_cwd() })
         end, [[Grep Ftype]]
      },
      ['<C-f>'] = { function()
            FzfLua.buffers({ cwd_only = true })
         end, [[Buffers (Cwd Only)]]
      }
   }
},  {
   mode = "n", prefix = "<leader>", buffer = nil, silent = false, noremap = true
})
