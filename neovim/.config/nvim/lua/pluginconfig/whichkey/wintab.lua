wk = require("which-key")

wk.register({
    name = 'Window Movements',
    l    = { [[<Cmd>silent! wincmd l<cr>]], "right"},
    h    = { [[<Cmd>silent! wincmd h<cr>]], "left"},
    j    = { [[<Cmd>silent! wincmd j<cr>]], "down"},
    k    = { [[<Cmd>silent! wincmd k<cr>]], "up"},
    s    = { [[<Cmd>silent! wincmd W<cr>]], "switch"},
    i    = { [[<Cmd>silent! wincmd o<cr>]], "only"},
    m    = { [[<Cmd>silent! wincmd c<cr>]], "close"},
    n    = { [[<Cmd>silent! wincmd n<cr>]], "new"},
    r    = { [[<Cmd>silent! wincmd r<cr>]], ""},
    v    = { [[<Cmd>silent! vsplit<cr>]], ""},
    ["<"]   = { [[<Cmd>silent! split<cr>]], ""},
    ['<leader>'] = {
        name = 'move',
        l = { [[<Cmd>silent! wincmd L<cr>]], "right" },
        h = { [[<Cmd>silent! wincmd H<cr>]], "left" },
        j = { [[<Cmd>silent! wincmd J<cr>]], "" },
        k = { [[<Cmd>silent! wincmd K<cr>]], "" },
        s = { [[<Cmd>silent! e #<cr>]], ""},
        v = { [[<Cmd>silent! vsplit #<cr>]], ""},
        ["<"] = { [[<Cmd>silent! split #<cr>]], ""}
    },
    g = {
        name = '',
        f = { [[<cmd>silent! vsplit <cfile><cr>]], 'split under cursor'}
    }
},  {
    mode = "n", prefix = "s", buffer = nil, silent = true, noremap = true
})


wk.register({
    s = {
        name = 'Tab movement',
        l    = { [[<Cmd>silent! +tabnext<cr>]], 'next'},
        k    = { [[<Cmd>silent! -tabnext<cr>]], 'prev'},
        n    = { [[<Cmd>silent! tabnew<cr>]], 'new'},
        m    = { [[<Cmd>silent! tabclose!<cr>]], 'close'},
        g    = {
            name = 'vsplit',
            f    = { [[<Cmd>silent! tab vsplit <cfile><cr>]], '<gf> in new tab'}
        },
        ['<leader>'] = {
            name  = '',
            m     = { [[<Cmd>silent! tabonly!<cr>]], [[close all others]] },
            s     = { [[<Cmd>silent! tabedit #<cr>]], [[open # in new tab]]}
        }
    }
},  {
    mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})
