local ok, actions = pcall(require, 'fzf-lua.actions')

if not ok then return end

local plugin_opts = {
   global_resume       = true,
   global_resume_query = true,  -- include typed query in `resume`?
   git_icons           = true,  -- show git icons?
   file_icons          = true,  -- show file icons?
   trim_entry          = true,
   color_icons         = true,  -- colorize file|git icons
   keymap = {
      fzf = {               -- fzf '--bind=' options
         ['f2']         = 'toggle-preview',
         ['f3']         = 'toggle-preview-wrap',
         ['ctrl-d']     = 'half-page-down',
         ['ctrl-u']     = 'half-page-up',
         -- ['ctrl-a']     = 'toggle-all',
         ['ctrl-a']     = 'select-all+accept',
         ['ctrl-r']     = 'toggle+down',
         ['ctrl-j']     = 'down',
         ['ctrl-k']     = 'up',
         ['ctrl-h']     = 'clear-query'
      }
   },
   -- function(selected, o) require'myhelper'.gxmessage({ selected = selected, o = o }) end
   actions = {
      buffers = {
         ['default'] = actions.buf_edit,
         ['ctrl-s']  = actions.buf_split,
         ['ctrl-v']  = actions.buf_vsplit,
         ['ctrl-t']  = actions.buf_tabedit,
         ['ctrl-x']  = { actions.buf_del, actions.resume }
      },
      files = {
         ['default'] = actions.file_edit_or_qf,
         ['ctrl-s']  = actions.file_split,
         ['ctrl-v']  = actions.file_vsplit,
         ['ctrl-t']  = actions.file_tabedit,
      }
   },
   fzf_opts = {
      -- options are sent as `<left>=<right>`
      -- set to `false` to remove a flag
      -- set to '' for a non-value flag
      -- for raw args use `fzf_args` instead
      ['--ansi']   = '',
      ['--prompt'] = '> ',
      ['--info']   = 'inline',
      ['--height'] = '100%',
      ['--layout'] = 'reverse'
   },
   fzf_colors = {
      ['bg']      = { 'bg', 'MyFzfBg' },
      ['fg']      = { 'fg', 'MyFzfFg' },
      ['hl']      = { 'fg', 'MyFzfInfo' },
      ['bg+']     = { 'bg', 'MyFzfBgPlus' },
      ['fg+']     = { 'fg', 'MyFzfFgPlus' },
      ['hl+']     = { 'fg', 'MyFzfHighPlus' },
      ['info']    = { 'fg', 'MyFzfInfo' },
      ['prompt']  = { 'fg', 'MyFzfPrompt' },
      ['pointer'] = { 'fg', 'MyFzfPointer' },
      ['marker']  = { 'fg', 'MyFzfMarker' },
      ['spinner'] = { 'fg', 'MyFzfSpinner' },
      ['header']  = { 'fg', 'MyFzfSpinner' },
      ['gutter']  = { 'bg', 'MyFzfGutter' },
   },
   previewers = {
      cat = {
         cmd             = 'cat',
         args            = '--number',
      },
      bat = {
         cmd             = 'bat',
         args            = '--style numbers --color always',
         theme           = 'zenburn', -- bat --list-themes,
         config          = nil,            -- nil uses $BAT_CONFIG_PATH
      },
      builtin = {
         syntax          = true,         -- preview syntax highlight?
         syntax_limit_l  = 100,            -- syntax limit (lines), 0=nolimit
         syntax_limit_b  = 1024*1024    -- syntax limit (bytes), 0=nolimit
      },
      man = {
         cmd = 'man -c %s | col -bx'
      }
   },
   winopts = {
      border = 'none',
      hl = {
         normal = 'MyFzfLuaDefault',
         border = 'MyFzfLuaBorder'
      },
      preview = {
         default    = 'bat',
         border     = 'noborder',
         hidden     = 'nohidden',
         layout     = 'horizontal',
         scrolloff  = '-2',
         vertical   = 'down:20%',
         horizontal = 'right:50%',
         scrollbar  = 'border',
         title      = false,
         delay      = 50,
         winopts    = {
            number         = false,
            relativenumber = false,
            cursorline     = false,
            cursorlineopt  = 'both',
            cursorcolumn   = false,
            signcolumn     = 'no',
            list           = false,
            foldenable     = false
            -- winhighlight   = 'Normal:MyFzfBg'
         }
      },
      on_create = function()
         mappings = {
            ['<S-PageUp>'] = { function()
                  require'fzf-lua.win'.preview_scroll(-1)
               end, ''
            },
            ['<S-PageDown>'] = { function()
                  require'fzf-lua.win'.preview_scroll(1)
               end, ''
            }
         }

         -- vim.opt_local.buflisted = false
         -- vim.opt_local.bufhidden = 'wipe'
         -- vim.opt_local.signcolumn = 'no'

         require('which-key').register(mappings, {
            buffer = 0,
            mode = 't',
            noremap = true
         })
      end
   },
   -- provider setup
   files = {
      multiprocess = true
   },
   git = {
      files = {
         prompt = 'GitFiles❯ ',
         multiprocess = true
      },
      status = {
         cmd = [[git status -s | awk '{ _ = $1 OFS $2 ; "stat -c %Y " $2 | getline ; print $0, _}' | sort -r | awk '{ printf "%2s %s\n", $2, $3 }']],
         winopts = {
            fullscreen = true,
            preview = {
               horizontal = 'right:60%'
            }
         }
      }
   },
   helptags = {
      fzf_opts = {
         ['--tiebreak'] = 'index'
      }
   },
   manpages = {
      previewer = {
         _ctor = require'fzf-lua.previewer'.fzf.man_pages
      }
   },
   buffers = {
      previewer = false,
      sort_lastused = true,
      ignore_current_buffer = true,
      -- show_all_buffers = true,
      winopts = {
         split = 'botright 15new'
      }
   },
   grep = {
      prompt       = 'Rg❯ ',
      input_prompt = 'Grep For❯ ',
      rg_opts      = '-g "!{.git,node_modules}/*"',
      git_icons    = true,           -- show git icons?
      file_icons   = true,           -- show file icons?
      color_icons  = true,           -- colorize file|git icons
      multiprocess = true,
      no_esc       = 2,
      winopts = {
         split = 'botright 30new',
         preview = {
            layout = 'vertical',
            vertical = 'down:20%'
         }
      }
   },
   lsp = {
      prompt            = '❯ ',
      -- cwd               = vim.loop.cwd(),
      cwd_only          = false,      -- LSP/diagnostics for cwd only?
      async_or_timeout  = true,       -- timeout(ms) or false for blocking calls
      file_icons        = true,
      git_icons         = false,
      lsp_icons         = true,
      severity          = 'hint',
      fzf_opts = {
         ['--keep-right'] = ''
      },
      icons = {
         ['Error']       = { icon = '', color = 'red' },       -- error
         ['Warning']     = { icon = '', color = 'yellow' },    -- warning
         ['Information'] = { icon = '', color = 'blue' },      -- info
         ['Hint']        = { icon = '', color = 'magenta' },   -- hint
      },
      winopts = {
         preview = {
            layout = 'vertical',
            vertical = 'down:25%'
         }
      }
   },
   oldfiles = {
      cwd_only = false,
      stat_file = true,
      include_current_session = true,
      fzf_opts = {
         ['--tiebreak'] = 'index',
      },
      winopts = {
         width = 0.95,
         preview = {
            horizontal = 'right:37%'
         }
      }
   }
}

require'fzf-lua'.setup(plugin_opts)
