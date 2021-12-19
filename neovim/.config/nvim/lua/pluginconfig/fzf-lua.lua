local t = {}

local actions = require'fzf-lua.actions'
local helper  = require'myhelper'

t.custom = {}

t.custom.git_files = function(opts)

   local default_opts = {
      prompt      = 'GitFiles❯ '
   }

   local merged_opts = type(opts) == 'table' and
      vim.tbl_deep_extend('force', default_opts, opts or {}) or
      default_opts

   local exclude = not vim.fn.expand('%:.') == ''
      and '--exclude "' .. vim.fn.expand('%:.') .. '" '
      or ''

   merged_opts.cwd = merged_opts.cwd and merged_opts.cwd or
      helper.git_get_root_or_cwd()

   merged_opts.cmd = table.concat({
      'fdfind -t f -H ',
      exclude,
      '--base-directory "',
      merged_opts.cwd or vim.env.PWD , '" ',
      '--exec stat --printf="%Y\t%n\n"',
      ' | sort -r -k 1 | cut -f 2'
   })

   require'fzf-lua'.files(merged_opts)
end

local floatMultiColArgs = function()

   local w = { max = 125, col1 = 40 }

   w.float = vim.opt.columns:get() * 0.8 > w.max and w.max
         or vim.opt.columns:get() * 0.8
   w.floatr = math.floor(w.float / vim.opt.columns:get() * 100 ) / 100
   w.col2 = math.floor( (w.float - w.col1) / w.float * 100)

   return {
      layout     = ( w.float > 100 and 'horizontal' or 'vertical' ),
      horizontal = string.format('right:%d%%', w.col2 ),
      width      = w.floatr,
      vertical   = 'down:40%'
   }
end

require'fzf-lua'.setup({
   global_resume  = true,
   git_icons      = true,           -- show git icons?
   file_icons     = true,           -- show file icons?
   color_icons    = true,           -- colorize file|git icons
   actions = {
      ['ctrl-q'] = function(s) helper.gxmessage(s) end
   },
   keymap = {
      fzf = {               -- fzf '--bind=' options
         ['f2']         = 'toggle-preview',
         ['f3']         = 'toggle-preview-wrap',
         ['ctrl-d']     = 'half-page-down',
         ['ctrl-u']     = 'half-page-up',
         ['ctrl-a']     = 'toggle-all',
         ['ctrl-r']     = 'toggle+down',
         ['ctrl-j']     = 'down',
         ['ctrl-k']     = 'up',
         ['ctrl-h']     = 'clear-query'
      }
   },
   fzf_opts = {
      -- options are sent as `<left>=<right>`
      -- set to `false` to remove a flag
      -- set to '' for a non-value flag
      -- for raw args use `fzf_args` instead
      ['--ansi']        = '',
      ['--prompt']      = '> ',
      ['--info']        = 'inline',
      ['--height']      = '100%',
      ['--layout']      = 'reverse'
   },
   fzf_colors = {
      ["bg"]      = { "bg", "MyFzfBg" },
      ["fg"]      = { "fg", "MyFzfFg" },
      ["hl"]      = { "fg", "MyFzfInfo"},
      ["bg+"]     = { "bg", "MyFzfBgPlus" },
      ["fg+"]     = { "fg", "MyFzfFgPlus" },
      ["hl+"]     = { "fg", "MyFzfHighPlus" },
      ["info"]    = { "fg", "MyFzfInfo" },
      ["prompt"]  = { "fg", "MyFzfPrompt" },
      ["pointer"] = { "fg", "MyFzfPointer" },
      ["marker"]  = { "fg", "MyFzfMarker" },
      ["spinner"] = { "fg", "MyFzfSpinner" },
      ["header"]  = { "fg", "MyFzfSpinner" },
      ["gutter"]  = { "bg", "MyFzfGutter" },
   },
   winopts = {
      border = 'none',
      hl = {
         normal = 'MyFzfLuaDefault',
         border = 'MyFzfLuaBorder'
      },
      preview = {
         default        = 'bat',
         border         = 'noborder',
         hidden         = 'nohidden',
         layout         = 'horizontal',
         vertical       = 'down:20%',
         horizontal     = 'right:40%',
         scrollbar      = 'border',
         title          = false
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
               },
               ['`'] = {
                  name = '',
                  a = { function()
                        helper.gxmessage('sss')
                     end, 'ss'
                  }
               }
            }

            vim.opt_local.buflisted = false
            vim.opt_local.bufhidden = 'wipe'
            vim.opt_local.signcolumn = 'no'

            require('which-key').register(mappings, {
               buffer = 0,
               mode = 't',
               noremap = true
            })
         end
   },
   previewers = {
      cat = {
         cmd             = "cat",
         args            = "--number",
      },
      bat = {
         cmd             = "bat",
         args            = "--style numbers --color always",
         theme           = 'zenburn', -- bat --list-themes,
         config          = nil,            -- nil uses $BAT_CONFIG_PATH
      },
      builtin = {
         syntax          = true,         -- preview syntax highlight?
         syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
         syntax_limit_b  = 1024*1024    -- syntax limit (bytes), 0=nolimit
      },
      man = {
         cmd = "man -c %s | col -bx"
      }
   },
   files = {
      multiprocess = true
   },
   git = {
      files = {
         prompt = 'GitFiles❯ ',
         multiprocess = true
      }
   },
   helptags = {
      -- winopts_raw = floatMultiColArgs,
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
      winopts = {
         preview = {
            preview_layout = 'horizontal',
            preview_horizontal = 'down:28%',
            ignore_current_buffer = true,
            no_term_buffers = false
         }
      }
   },
   grep = {
      prompt       = 'Rg❯ ',
      input_prompt = 'Grep For❯ ',
      rg_opts      = "-g '!{.git,node_modules}/*'",
      git_icons    = true,           -- show git icons?
      file_icons   = true,           -- show file icons?
      color_icons  = true,           -- colorize file|git icons
      multiprocess = true,
      no_esc       = 2,
      actions      = {
         ['ctrl-q']  = actions.file_sel_to_qf,
      },
      winopts = {
         split = 'belowright new'
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
      severity          = "hint",
      fzf_opts = {
         ['--keep-right'] = ''
      },
      icons = {
         ["Error"]       = { icon = "", color = "red" },       -- error
         ["Warning"]     = { icon = "", color = "yellow" },    -- warning
         ["Information"] = { icon = "", color = "blue" },      -- info
         ["Hint"]        = { icon = "", color = "magenta" },   -- hint
      },
      winopts = {
         preview = {
            layout = 'vertical',
            vertical = 'down:25%'
         }
      }
   },
   oldfiles = {
      cwd = vim.env.HOME,
      fzf_opts = {
         ['--tiebreak'] = 'index',
      }
   }
})

return t
