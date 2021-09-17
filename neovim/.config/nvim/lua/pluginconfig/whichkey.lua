wk = require("which-key")

require'which-key.plugins.registers'.registers =  '+"-:.%/#=_adfjkn0123456789'

wk.setup {
    plugins = {
        marks = true,
        registers = true,
    },
    window = {
        margin = { 0, 5, 2, 50 },
        padding = { 0, 0, 0, 3 }
    },
    layout = {
        height = { min = 1, max = 10 }, -- 
        width = { min = 5, max = 38 }, -- 
        spacing = 4, -- spacing between columns
        align = "left",
    },
    hidden = {
        "<silent>", 
        "execute", "<cmd>", "<Cmd>", 
        "<CR>", "call", "lua", "^:", "^ "
    },
    triggers_blacklist = {
        i = { [[']] }
    },
    show_help = true
}

wk.register({
    name = 'etc',
    ["<F5>"] = { [[:write<cr>:silent Reload<cr>]], 'Reload settings'},
    ["<F6>"] = { [[<Cmd>lua print('asdasd')<cr>]], 'Reload settings'}
},  {
    mode = "n", prefix = "", buffer = nil, silent = true, noremap = true
})

wk.register({
    h = { [[<Cmd>Gitsigns select_hunk<cr>]], 'Hunk'},
},  {
    mode = "o", prefix = "i", buffer = nil, silent = true, noremap = true
})

wk.register({
   ["."] = {
        name = 'Exec',
        n    = { [[<Cmd>silent !xdg-open %:p:h<CR>]], "Nautilus" },
        g    = { [[<Cmd>lua require('plenary.job'):new({command = 'gitg'}):start()<CR>]], "Gitg" }
    },
    e = {
        name = 'Edit/Sub',
        e    = { [[:%s###c<Left><Left><Left>]], [[Substitute]], silent = false },
        w    = { [[:%s#=expand('<cword>')<cr>##c<Left><Left>]], [[ ]], silent = false }
    },
    j = {
        name = 'Utils',
        h = {
            name = 'GitSigns',
            l    = { [[<Cmd>Gitsigns toggle_linehl<CR>]], "Togl linehl" },
            n    = { [[<Cmd>Gitsigns toggle_numhl<CR>]], "Togl numhl" },
            s    = { [[<cmd>Gitsigns stage_hunk<CR>]], [[Stage Hunk]] },
            u    = { [[<cmd>Gitsigns undo_stage_hunk<CR>]], [[Undo Stage Hunk]] },
            r    = { [[<cmd>Gitsigns reset_hunk<CR>]], [[Reset Hunk]] },
            p    = { [[<cmd>Gitsigns preview_hunk<CR>]], [[Preview Hunk]] },
            b    = { [[<cmd>Gitsigns blame_line<CR>]], [[Blame Line]] }
        },
        p = {
            name = 'Packer',
            u    = { [[<Cmd>PackerUpdate<CR>]], 'Update'},
            s    = { [[<Cmd>PackerStatus<CR>]], 'Status'},
            i    = { [[<Cmd>PackerInstall<CR>]], 'Install'}
        },
        g = {
            name = 'Gutentags',
            g    = { [[:GutentagsUpdate<CR>]], [[Update]] }
        },
        f = {
            name = 'Format',
            a    = { [[:EasyAlign<CR>]], "EasyAlign" },
            j    = { [[:lua require("revj").format_line()<CR>]], [[RevJ]] }
        },
        u = {
            name = 'UltiSnips',
            s    = { [[:UltiSnipsEdit<CR>]], [[Edit]]}
        }
    },
    x = {
        name = 'Git',
        x    = { [[<Cmd>cclose <bar> tab Git<CR>]], [[Git]] },
        l    = { [[<Cmd>Git log<CR>]], [[Git Log]] },
        p    = { [[<Cmd>Git push<CR>]], [[Git Push]] },
        i    = { [[<Cmd>Gvdiffsplit<CR>]], [[Git Split]] }
    },
},  {
    mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})

wk.register({
    e = {
        name = 'Edit/Sub',
        e    = { [[:s###c<Left><Left><Left>]], [[Substitute]], silent = false }
    },
    j = {
        name = 'Utils',
        f = {
            name = 'Format',
            a    = { [[:EasyAlign<CR>]], "EasyAlign" },
            j    = { [[:lua require("revj").format_visual()<CR>]], [[RevJ]] } 
        }
    }
},  {
    mode = "v", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})


wk.register( {
    c = {
        name        = 'Comment',
        c           = { [[<plug>kommentary_line_default]],  [[Toggle Commi]] }
    }
},  {
    mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = false
})

wk.register( {
    c = {
        name        = 'Comment',
        c           = { [[<plug>kommentary_visual_default<C-c>]],  [[Toggle Commi]] }
    }
},  {
    mode = "v", prefix = "<leader>", buffer = nil, silent = true, noremap = false
})

require'pluginconfig.whichkey.wintab'
require'pluginconfig.whichkey.browser'
require'pluginconfig.whichkey.display'
require'pluginconfig.whichkey.denite'
require'pluginconfig.whichkey.hop'

-- wk.register({
      -- ['<C-p>']     = { [[<Cmd>lua require'cmp'.mapping.select_prev_item()<cr>]], [[]] }, 
      -- ['<C-n>']     = { [[<Cmd>lua require'cmp'.mapping.select_next_item()<cr>]], [[]] }, 
      -- ['<C-d>']     = { [[<Cmd>lua require'cmp'.mapping.scroll_docs(-4)<cr>]], [[]] }, 
      -- ['<C-f>']     = { [[<Cmd>lua require'cmp'.mapping.scroll_docs(4)<cr>]], [[]] }, 
      -- ['<C-Space>'] = { 
      --    function ()
      --       local cmp = require'cmp'
      --       cmp.mapping.confirm {
      --          behavior = cmp.ConfirmBehavior.Insert,
      --          select = true,
      --       }
      --    end, [[]] 
      -- }, 
      -- ['<C-e>']     = { [[<Cmd>lua require'cmp'.mapping.close()<cr>]], [[]] }
      -- ['<CR>']      = { [[<Cmd>lua require'cmp'.mapping.confirm( { behavior = require'cmp'.ConfirmBehavior.Insert, select = true})<cr>]], [[]] }
--     }, {
--     mode = "i", buffer = nil, silent = true, noremap = true
-- }) 
-- wk.register( {
--     ["<C-Space>"] = { [[compe#complete()]], [[]], expr = true},
--     ["<CR>"]      = { [[compe#confirm ("<CR>")]], [[]], expr = true},
--     ["<C-e>"]     = { [[compe#close   ("<C-e>")]], [[]], expr = true},
--     ["<C-j>"]     = { [[compe#scroll  ({ "delta": +4 })]], [[]], expr = true},
--     ["<C-k>"]     = { [[compe#scroll  ({ "delta": -4 })]], [[]], expr = true}
-- },  {
--     mode = "i", buffer = nil, silent = true, noremap = true
-- })
