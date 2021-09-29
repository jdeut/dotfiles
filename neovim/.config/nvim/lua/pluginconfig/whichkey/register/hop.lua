wk = require("which-key")

wk.register({
    name = 'Hop',
    w    = { [[<cmd>lua require'hop'.hint_words( { winblend = 0 } )<cr>]], [[ ]]},
    j    = { [[<cmd>lua require'hop'.hint_lines_skip_whitespace( { winblend = 100 } ) vim.cmd("normal zz")<cr>]], [[Line]] },
    f    = { [[<cmd>lua require'hop'.hint_char1( { winblend = 0 } )<cr>]], [[ ]] }
},  {
    mode = "n", prefix = "f", buffer = nil, silent = true, noremap = true
})

wk.register({
    name = 'Hop',
    w    = { [[<cmd>lua require'hop'.hint_words( { winblend = 0 } )<cr>]], [[ ]]},
    j    = { [[<cmd>lua require'hop'.hint_lines_skip_whitespace( { winblend = 100 } ) vim.cmd("normal zz")<cr>]], [[Line]] },
    f    = { [[<cmd>lua require'hop'.hint_char1( { winblend = 0 } )<cr>]], [[ ]] }
},  {
    mode = "v", prefix = "f", buffer = nil, silent = true, noremap = true
})

wk.register({
    name = 'Hop',
    w    = { [[<cmd>lua require'hop'.hint_words( { winblend = 0 } )<cr>]], [[Word]] },
    j    = { [[<cmd>lua require'hop'.hint_lines_skip_whitespace( { winblend = 100 } ) vim.cmd("normal zz")<cr>]], [[Line]] },
    f    = { [[<cmd>lua require'hop'.hint_char1( { winblend = 0 } )<cr>]], [[Char]] }
},  {
    mode = "o", prefix = "f", buffer = nil, silent = true, noremap = true
})
