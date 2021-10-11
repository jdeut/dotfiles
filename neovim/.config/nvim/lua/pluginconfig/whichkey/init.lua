wk = require("which-key")

require'which-key.plugins.registers'.registers =  '+"-:.%/#=_adfjkn0123789'

wk.setup {
    plugins = {
        marks = true,
        registers = true,
    },
    window = {
        margin = { 0, 10, 4, 10 },
        padding = { 0, 0, 0, 0 },
        border = 'single'
    },
    layout = {
        height = { min = 4, max = 22 }, -- 
        width = { min = 5, max = 40 }, -- 
        spacing = 5, -- spacing between columns
        align = "center",
    },
    hidden = {
        "execute", "<cmd>", "<Cmd>", 
        "<CR>", "call", "lua", "^:", "^ "
    },
    triggers = {
        '<localleader>', '<leader>', 's', 'z', 'g', ']', '['
    },
    motions = { count = false },
    triggers_blacklist = {},
    -- triggers_blacklist = {
    --     i = { [[']] }
    -- },
    show_help = true
}

require'pluginconfig.whichkey.register.main'
require'pluginconfig.whichkey.register.wintab'
require'pluginconfig.whichkey.register.browser'
require'pluginconfig.whichkey.register.display'
require'pluginconfig.whichkey.register.denite'
require'pluginconfig.whichkey.register.hop'
require'pluginconfig.whichkey.register.floaterm'
require'pluginconfig.whichkey.register.terminal'
