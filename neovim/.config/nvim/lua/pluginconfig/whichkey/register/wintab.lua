wk = require("which-key")

wk.register({
    s = { function() require('which-key').show('s', { mode = 'n', auto = true }) end, '' }
}, {
    mode = "n", silent = true
})

local function ccmd(cmd, opts)
    local count = vim.api.nvim_eval('v:count') 
    local prefix_mod = ''

    count = count > 0 and count or ''

    if opts then
        prefix_mod = opts.prefix_mod and opts.prefix_mod .. [[ ]] or ''
    end

    vim.v.errmsg = ''

    vim.cmd( [[silent! ]] .. prefix_mod .. [[ ]] .. count .. cmd)

    if vim.v.errmsg ~= '' then
        print(vim.v.errmsg)
        vim.defer_fn( function() vim.cmd('echo ') end, 1400)
    end
end

local function wincmd(cmd, opts)
    ccmd( [[wincmd ]] .. cmd )
end

wk.register({
    -- ['<C-j>'] = { function() ccmd('bnext') end, 'Bnext'},
    ['<C-k>'] = { function() ccmd('b#') end, 'Bprev'},
    ['<M-C-k>'] = { function() ccmd('vertical sb#') end, 'Bprev'}
},  {
    mode = "n" , noremap = false
})

wk.register({
    name      = 'Buffer/Window/Tab Management',
    d         = { function() ccmd('tabnext') end, "Tabnext"},
    D         = { function() ccmd('tabm+') end, "Move Right"},
    a         = { function() ccmd('tabprev') end, "Tabprev"},
    A         = { function() ccmd('tabm-') end, "Move Left"},
    l         = { function() wincmd('l') end, "right"},
    h         = { function() wincmd('h') end, "left"},
    j         = { function() wincmd('j') end, "down"},
    k         = { function() wincmd('k') end, "up"},
    -- f         = { function() wincmd('f') end, "Split File Under Cursor"},
    -- ['<S-f>'] = { function() wincmd('F') end, "Split File Under Cursor"},
    f = {
        name = 'Floaterm',
        ['<C-f>'] = { [[<Cmd>FloatermNew! cd %:p:h ; clear<CR>]], "NewFloaterm in Cwd"},
        n = { [[<Cmd>FloatermNew --position=top --width=81 --height=0.7<CR>]], "NewFloaterm in Cwd"},
        i = { require("Fn/floaterm-toggle-size").toggle, "Toggle Size"}
    },
    s         = { function() wincmd('W') end, "switch"},
    i         = { function() wincmd('o') end, "only"},
    m         = { function() wincmd('c') end, "close"},
    n         = { function() wincmd('n') end, "new"},
    N         = { [[<Cmd>rightbelow vnew<cr>]], "new"},
    K         = { function() wincmd('K') end, "Move Up" },
    L         = { function() wincmd('L') end, "Move Right" },
    H         = { function() wincmd('H') end, "Move Left" },
    J         = { function() wincmd('J') end, "Move Down" },
    ['=']        = { function() wincmd('=') end, "Equal Size" },
    ['+']        = { function() wincmd('+') end, "Increase Height" },
    ['-']        = { function() wincmd('-') end, "Decrease Height" },
    ['<']        = { function() wincmd('<') end, "Decrease Width" },
    ['>']        = { function() wincmd('>') end, "Increase Width" },
    t            = { function() wincmd('t') end, "open in tab"},
    r            = { function() wincmd('r') end, "rotate right"},
    ['<S-r>']    = { function() wincmd('R') end, "rotate left"},
    v            = { function() wincmd('v', { prefix_mod = 'leftabove'}) end, "vsplit"},
    ['<S-v>']    = { function() wincmd('v', { prefix_mod = 'rightbelow'}) end, "vsplit"},
    ['%']        = { [[<Cmd>vsplit<cr>]], "vsplit"},
    ['"']        = { [[<Cmd>split<cr>]], "split"},
    g            = {
        name  = 'move',
        f         = { function() wincmd('gf') end, "Open File Under Cursor in Tab"},
        ['<S-f>'] = { function() wincmd('gF') end, "Open File Under Cursor in Tab"},
        s         = { [[<Cmd>silent! e #<cr>]], "Alternate"},
        v         = { [[<Cmd>silent! vsplit #<cr>]], "Alternate Vsplit"},
        ["<"]     = { [[<Cmd>silent! split #<cr>]], "Alternate Split"}
    }
},  {
    mode = "n", prefix = "s", silent = true
})


wk.register({
    s = {
        name = 'Tab movement',
        l    = { [[<Cmd>tabnext<cr>]], 'next'},
        h    = { [[<Cmd>tabprev<cr>]], 'prev'},
        n    = { [[<Cmd>silent! tabnew<cr>]], 'new'},
        m    = { [[<Cmd>silent! tabclose!<cr>]], 'close'},
        ['<leader>'] = {
            name  = '',
            m     = { [[<Cmd>silent! tabonly!<cr>]], [[close all others]] },
            s     = { [[<Cmd>silent! tabedit #<cr>]], [[open # in new tab]]}
        }
    }
},  {
    mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})
