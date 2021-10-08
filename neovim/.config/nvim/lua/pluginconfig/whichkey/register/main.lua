-- copy into + register with <DEL>
wk.register({ ["<DEL>"] = { [["+]], '' } },  { mode = "v" })
wk.register({ ["<DEL>"] = { ["<DEL>"] = { [["+y]], '' } } },  { mode = "v" })
wk.register({ ["<DEL>"] = { [["+]], '' } },  { mode = "n" })
wk.register({ ["<DEL>"] = { ["<DEL>"] = { [["+yy]], '' } } },  { mode = "n" })

wk.register({
    ['<F5>']  = { [[:write<cr>:silent Reload<cr>]], 'Reload settings' },
    ['<Space>'] = { [[:]], 'Enter Command-Line Mode', silent  = false}
},  { mode = "n" })

wk.register({
    ['<Space>'] = { [[:]], 'Enter Command-Line Mode', silent = false}
},  { mode = "v" })

wk.register({
    n = { vim.lsp.diagnostic.goto_next, "next error"},
    N = { vim.lsp.diagnostic.goto_prev, "prev error"},
    i = { vim.lsp.buf.implementation, "code action"},
    d = { vim.lsp.buf.definition, "go to definition"},
    D = { vim.lsp.buf.declaration, "go to definition"},
    h = { vim.lsp.buf.hover, "hover"},
    r = { vim.lsp.buf.references, "references"},
    s = { vim.lsp.buf.rename, "rename"},
}, { mode = "n", prefix = "g" })

wk.register({
    h = { [[<Cmd>Gitsigns select_hunk<cr>]], 'Hunk'},
}, { mode = "o", prefix = "i" })

wk.register({
    ['/'] = {
        name = 'localleader',
        ['/']    = { [[/]], "Search", silent = false}
    }
}, { mode = "n", prefix = "" })

wk.register({
    [":"] = {
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
        w = { [[<Cmd>WhichKey<CR>]], 'WhichKey Show All' },
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
        u = {
            name = 'UltiSnips',
            s    = { [[:UltiSnipsEdit<CR>]], [[Edit]]}
        },
    },
    i = {
        name = 'Git',
        i    = { [[<Cmd>cclose <bar> tab Git<CR>]], [[Git]] },
        w    = { [[<Cmd>Gwrite<CR>]], [[Git Write]] },
        m    = { [[:GMove <C-r>%]], [[Git Move]], silent = false},
        d    = { [[<Cmd>GDelete<CR>]], [[Git Delete file]] },
        c    = { [[<Cmd>Git commit --quiet<CR>]], [[Git Commit]] },
        l    = { [[<Cmd>Git log<CR>]], [[Git Log]] },
        p    = { [[<Cmd>Git push<CR>]], [[Git Push]] },
        s    = { [[<Cmd>Gvdiffsplit<CR>]], [[Git Split]] },
        h    = {
            name = 'GitSigns (Hunks)',
            l    = { require'gitsigns'.toggle_linehl, [[Toggle linehl]] },
            u    = { require'gitsigns'.toggle_numhl, [[Toggle numhl]] },
            w    = { require'gitsigns'.toggle_word_diff, [[Toggle Word Diff]] },
            s    = { require'gitsigns'.stage_hunk, [[Stage Hunk]] },
            u    = { require'gitsigns'.undo_stage_hunk, [[Undo Stage Hunk]] },
            r    = { require'gitsigns'.reset_hunk, [[Reset Hunk]] },
            v    = { require'gitsigns'.preview_hunk, [[Preview Hunk]] },
            b    = { require'gitsigns'.blame_line, [[Blame Line]] },
            n    = { require'gitsigns'.next_hunk, [[Jump to Next Hunk]] },
            p    = { require'gitsigns'.prev_hunk, [[Jump to Prev Hunk]] },
            q    = { require'gitsigns'.setqflist, [[Quickfix Show Hunks]] },
        }
    },
    q = {
       name = 'Quickfix',
       q    = { function()
             require('Fn/quickfix-toggle').toggle()
          end, 'toggle'
       },
       n    = { [[<cmd>cnext<CR>]], 'next entry'},
       p    = { [[<cmd>cprev<CR>]], 'previous entry'},
    }
},  { mode = "n", prefix = "<leader>" })

wk.register({
    e = {
        name = 'Edit/Sub',
        e    = { [[:s###c<Left><Left><Left>]], [[Substitute]], silent = false }
    },
    f = {
        name  = 'Format',
        a     = { [[:EasyAlign<CR>]], "EasyAlign" },
        ['='] = { [[:EasyAlign1=<CR>]], "EasyAlign" },
        j     = { [[:lua require("revj").format_line()<CR>]], [[RevJ]] }
    }
},  { mode = "v", prefix = "<leader>" })

wk.register({
    f = {
        name = 'Format',
        j    = { [[:lua require("revj").format_line()<CR>]], [[RevJ]] }
    },
},  { mode = "n", prefix = "<leader>" })


wk.register( {
    ['<C-Space>'] = { function() vim.cmd([[wincmd p]]) end,  [[Go to previous window]] },
},  { mode = "t" })

wk.register( {
    ['<C-Space>'] = { function()
            vim.cmd([[wincmd p]])

            if vim.bo.buftype == 'terminal' then
                vim.cmd([[startinsert]])
            end
        end,  [[Go to previous window]] },
},  { mode = "n" })

wk.register( {
    ['<C-Space>'] = { function()
            vim.cmd([[wincmd p]])

            if vim.bo.buftype == 'terminal' then
                vim.cmd([[stopinsert]])
                vim.cmd([[normal i]])
            end
        end,  [[Go to previous window]]
    },
},  { mode = "i" })

wk.register( {
    c = {
        name = 'Comment',
        c    = { [[<plug>kommentary_line_default]],  [[Toggle Commi]] }
    }
},  { mode = "n", prefix = "<leader>", noremap = false })

wk.register( {
    c = {
        name = 'Comment',
        c    = { [[<plug>kommentary_visual_default<C-c>]],  [[Toggle Commi]] }
    }
},  { mode = "v", prefix = "<leader>", noremap = false })
