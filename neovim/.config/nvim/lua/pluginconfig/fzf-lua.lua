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
      color_icons        = true,           -- colorize file|git icons
      preview_horizontal = 'right:0%',
      preview_vertical   = 'down:0%',
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

   -- print(vim.inspect(merged_opts))

   require'fzf-lua'.files(merged_opts)
end

local floatArgs = function()

   local columns = vim.o.columns
   local lines = vim.o.lines

   local width = math.floor(columns - (columns * 1 / 10))
   local height = lines - 4

   local row = lines

   if columns < 100 then
     width = columns -- math.floor(columns - (columns * 1 / 5))
   end

   if lines < 30 then
      height = lines - 2
   end

   return {
      relative = 'editor',
      row = 0,
      col = math.floor((columns - width) / 2),
      width = width,
      height = height,
      style = 'minimal',
      border = nil
   }
end

require'fzf-lua'.setup({
    fzf_args = '--color=dark,preview-fg:#00ff00',
    preview_border = 'noborder',
    winopts_raw = floatArgs,
    git_icons          = true,           -- show git icons?
    file_icons         = true,           -- show file icons?
    color_icons        = true,           -- colorize file|git icons
    fzf_args            = '',             -- adv: fzf extra args, empty unless adv
    fzf_binds           = {               -- fzf '--bind=' options
       ['f2']         = 'toggle-preview',
       ['f3']         = 'toggle-preview-wrap',
       ['shift-down'] = 'preview-page-down',
       ['shift-up']   = 'preview-page-up',
       ['ctrl-d']     = 'half-page-down',
       ['ctrl-u']     = 'half-page-up',
       ['ctrl-a']     = 'toggle-all',
       ['ctrl-space'] = 'toggle',
       ['ctrl-l']     = 'clear-query',
    },
    winopts = {
        win_border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        hl_border  = 'Folded'
    },
    git = {
        files = {
            prompt             = 'GitFiles❯ ',
            preview_horizontal = 'right:0%',
            preview_vertical   = 'down:0%',
         }
    },
    grep = {
       prompt             = 'Ag❯ ',
       input_prompt       = 'Grep For❯ ',
       cmd                = 'ag -i --color --hidden --vimgrep --nomultiline --',
       git_icons          = true,           -- show git icons?
       file_icons         = true,           -- show file icons?
       color_icons        = true,           -- colorize file|git icons
       preview_horizontal = 'right:0%',
       preview_vertical   = 'down:10%',
       actions = {
           ['ctrl-q']  = actions.file_sel_to_qf,
       },
    },
    oldfiles = {
        preview_horizontal = 'right:0%',
        preview_vertical   = 'down:0%',
        cwd                = vim.env.HOME
    }
})

return t
