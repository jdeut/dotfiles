local wk = require'which-key'

local ok, FzfLua = pcall(require, 'fzf-lua')

if not ok then return end

local t = {
   git_files = function(path)
      return function()
         require'pluginconfig.fzf-lua.git_files' { cwd = path }
      end
   end
}

wk.register({
   name = 'Hop',

   ['1'] = { t.git_files('/home/johannes/.dotfiles/neovim/.config/nvim'), [[Nvim Config Dir]] },
   ['2'] = { t.git_files('/home/johannes/.dotfiles'), [[Dotfiles]] },
   ['3'] = { function()
         FzfLua.fzf_exec(
            [[ls -p -1 -t | grep -v '/$']],
            {
               cwd = vim.fn.stdpath('log'),
               preview = "tac {}",
               fzf_opts = { ['--preview-window'] = 'nohidden,down,70%' }
            }
         )
      end, [[Logs]]
   },
   ["<leader>"] = {
      name = 'Fzf',
      f = { FzfLua.buffers,  [[Buffers]] },
      n = { function()
            require'fzf-lua'.oldfiles{ stat_files = true }
         end, [[Oldfiles]]
      },
      i = { FzfLua.git_status, [[Git status]] },
      c = { FzfLua.git_commits, [[Git commits]] },
      d = { FzfLua.dap_commands, [[Git commits]] },
      C = { FzfLua.git_bcommits, [[Git status]] },
      h = { FzfLua.help_tags , [[Help]] },
      m = { FzfLua.man_pages , [[Help]] },
      a = { require'pluginconfig.fzf-lua.git_files' , [[Git Files]] },
      ['?'] = { FzfLua.live_grep_resume, [[Grep Resume]]},
      ['8'] = { FzfLua.grep_cword, [[Grep Ftype Cword]] },
      ['/'] = { FzfLua.live_grep, [[Grep Ftype]] },
      l = {
         name = 'Lsp',
         i = { FzfLua.lsp_implementations, [[implementations]] },
         a = { FzfLua.lsp_code_actions, [[code actions]] },
         d = { FzfLua.lsp_definitions, [[definitions]] },
         c = { FzfLua.lsp_declarations, [[declarations]] },
         l = { FzfLua.lsp_incoming_calls, [[incoming calls]] },
         L = { FzfLua.lsp_outgoing_calls, [[incoming calls]] },
         g = { FzfLua.lsp_document_diagnostics, [[document diagnostics]] },
         G = { FzfLua.lsp_workspace_diagnostics, [[workspace diagnostics]] },
         r = { FzfLua.lsp_references, [[references]] },
         s = { FzfLua.lsp_document_symbols, [[document symbols]] },
         S = { FzfLua.lsp_workspace_symbols, [[workspace symbols]] },
         t = { FzfLua.lsp_typedefs, [[typedefs]] },
         f = { function()
               print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, [[list workspace folders]]
         }
      },
      ['<C-f>'] = { function()
            FzfLua.buffers{
               no_term_buffers = false,
               show_unlisted = true
            }
         end, [[Buffers (Cwd Only)]]
      }
   }
},  {
   mode = "n", prefix = "<leader>", buffer = nil, silent = false, noremap = true
})
