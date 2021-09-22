t = {}

local actions = require'fzf-lua.actions'

t.custom = {}

t.custom.git_files = function()
   local path = vim.fn.expand('%:.')
   local cmd = 
      'fdfind -t f -H --exclude "' .. path .. '"' ..
      ' --exec stat --printf="%Y\t%n\n" | sort -r -k 1 | cut -f 2'

   require'fzf-lua'.git_files({
      prompt             = 'GitFiles❯ ',
      git_icons          = true,           -- show git icons?
      file_icons         = true,           -- show file icons?
      color_icons        = true,           -- colorize file|git icons
      preview_horizontal = "right:0%",
      cmd                = cmd
   })
end

require'fzf-lua'.setup({
    fzf_args = "--color=dark,preview-fg:#00ff00",
    preview_border = 'noborder',
    actions = {
        -- set bind to 'false' to disable
        ["default"]     = actions.file_edit,
        ["ctrl-s"]      = actions.file_split,
        ["ctrl-v"]      = actions.file_vsplit,
        ["ctrl-t"]      = actions.file_tabedit,
        ["alt-q"]       = actions.file_sel_to_qf,
        -- custom actions are available too
        -- ["ctrl-y"]      = function(selected) print(selected[2]) end,
    },
    git = {
        files = {
            prompt          = 'GitFiles❯ ',
            -- cmd             = 
            git_icons       = true,           -- show git icons?
            file_icons      = true,           -- show file icons?
            color_icons     = true,           -- colorize file|git icons
            preview_horizontal = "right:0%"
         }
    },
    oldfiles = {
        preview_opts = 'hidden',
        preview_horizontal = 'right:0%'
    }
})

return t
