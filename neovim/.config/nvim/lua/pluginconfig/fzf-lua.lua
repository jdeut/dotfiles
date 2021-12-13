t = {}

local actions = require'fzf-lua.actions'
local path    = require'fzf-lua.path'

t.custom = {}

t.custom.git_files = function(opts)

   local merged_opts

   local default_opts = {
      prompt             = 'GitFiles❯ ',
      git_icons          = true,           -- show git icons?
      file_icons         = true,           -- show file icons?
      color_icons        = true, -- colorize file|git icon,
      winopts = {
         preview = {
            hidden = 'nohidden',
            layout = 'vertical'
         }
      }
   }

   if not type(opts) == 'table' then
      merged_opts = default_opts
   else
      merged_opts = vim.tbl_deep_extend('force', default_opts, opts or {})
   end

   if not merged_opts.cwd then
      merged_opts.cwd = path.git_root(vim.fn.expand('%:h:.'))

      if not merged_opts.cwd then
      return
      end
   end

   local exclude = not vim.fn.expand('%:.') == ''
      and '--exclude "' .. vim.fn.expand('%:.') .. '" '
      or ''

   merged_opts.cmd = table.concat({
      'fdfind -t f -H ',
      exclude,
      '--base-directory "', merged_opts.cwd or vim.env.PWD , '" ',
      '--exec stat --printf="%Y\t%n\n"',
      ' | sort -r -k 1 | cut -f 2'
   })

   --
   --
   require'fzf-lua'.files(merged_opts)
end

local floatArgs = function()
   local columns = vim.o.columns
   local lines = vim.o.lines

   local crow, ccol = require'Fn.helper'.get_screen_cursor_position()

   local width = columns < 110
      and math.floor(columns - (columns * 1 / 10))
      or 110

   local height = lines < 25
      and lines - 10
      or  25 - 10

   local col =  ( math.abs(ccol - .5 * columns) > 25 and ccol or .5 * columns ) - .5 * width
   local row =  crow  - .5 * height

   print(row)

   return {
      relative = 'editor',
      row      = row,
      col      = math.floor(col),
      width    = width,
      height   = height,
      style    = 'minimal'
   }
end

require'fzf-lua'.setup({
   -- fzf_args       = '--color=dark,preview-fg:#00ff00',
   winopts_raw    = floatArgs,
   git_icons      = true,           -- show git icons?
   file_icons     = true,           -- show file icons?
   color_icons    = true,           -- colorize file|git icons
   keymap = {
      fzf = {               -- fzf '--bind=' options
         ['f2']         = 'toggle-preview',
         ['f3']         = 'toggle-preview-wrap',
         ['ctrl-d']     = 'half-page-down',
         ['ctrl-u']     = 'half-page-up',
         ['ctrl-a']     = 'toggle-all',
         ['ctrl-space'] = 'toggle',
         ['ctrl-j']     = 'down',
         ['ctrl-k']     = 'up',
         ['ctrl-l']     = 'clear-query'
      }
   },
   winopts = {
      border = false,
      hl = {
         normal = 'FzfLuaDefault',
         border = 'Folded'
      },
      preview = {
         default        = 'cat',
         border         = 'border',
         hidden         = 'nohidden',
         preview_layout = 'horizontal',
         vertical       = 'down:20%',
         scrollbar      = 'border'
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
         args            = "--style=numbers,changes --color always",
         theme           = 'zenburn' -- bat --list-themes
      }
   },
   git = {
      files = {
         prompt = 'GitFiles❯ ',
         winopts = {
            preview = {
               default = 'bat',
               layout = 'horizontal',
               title = false,
               hidden = 'nohidden',
               border = 'noborder'
            }
         }
      }
   },
   buffers = {
      default = 'bat',
      winopts = {
         preview = {
            preview_layout = 'horizontal',
            preview_horizontal = 'down:18%',
            ignore_current_buffer = true,
            no_term_buffers = false
         }
      }
   },
   grep = {
      prompt       = 'Rg❯ ',
      input_prompt = 'Grep For❯ ',
      rg_opts      = "--hidden --column --line-number --no-heading " ..
                     "--color=always --smart-case -g '!{.git,node_modules}/*'",
      git_icons    = true,           -- show git icons?
      file_icons   = true,           -- show file icons?
      color_icons  = true,           -- colorize file|git icons
      no_esc       = 2,
      -- preview_opts = 'hidden',
      actions      = {
         ['ctrl-q']  = actions.file_sel_to_qf,
      },
      winopts = {
         preview = {
            default = 'bat',
            title = false,
            hidden = 'nohidden',
            border = 'border',
            layout = 'vertical',
            vertical = 'down:25%'
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
      severity          = "hint",
      fzf_opts = { ['--keep-right'] = '' },
      icons = {
         ["Error"]       = { icon = "", color = "red" },       -- error
         ["Warning"]     = { icon = "", color = "yellow" },    -- warning
         ["Information"] = { icon = "", color = "blue" },      -- info
         ["Hint"]        = { icon = "", color = "magenta" },   -- hint
      },
      winopts = {
         preview = {
            default = 'bat',
            title = false,
            hidden = 'nohidden',
            border = 'border',
            layout = 'vertical',
            vertical = 'down:25%'
         }
      }
   },
   oldfiles = {
      cwd = vim.env.HOME,
      winopts = {
         preview = {
            default = 'bat',
            title = false,
            hidden = 'hidden',
            border = 'noborder'
         }
      }
   }
})

return t
