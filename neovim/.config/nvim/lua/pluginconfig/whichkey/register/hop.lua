wk = require("which-key")

wk.register({
    name = 'Hop',
    w = { require'hop'.hint_words, [[Word]] },
    j = { function()
            require'hop'.hint_lines_skip_whitespace()
            vim.cmd("normal zz")
        end, [[Line]]
    },
    f = { require'hop'.hint_char1, [[Char]] }
},  {
    mode = "n", prefix = "f"
})

wk.register({
    name = 'Hop',
    w = { require'hop'.hint_words, [[Word]] },
    j = { function()
            require'hop'.hint_lines_skip_whitespace()
            vim.cmd("normal zz")
        end, [[Line]]
    },
    f = { require'hop'.hint_char1, [[Char]] }
},  {
    mode = "v", prefix = "f"
})

wk.register({
    name = 'Hop',
    w = { require'hop'.hint_words, [[Word]] },
    j = { function()
            require'hop'.hint_lines_skip_whitespace()
            vim.cmd("normal zz")
        end, [[Line]]
    },
    f = { require'hop'.hint_char1, [[Char]] }
},  {
    mode = "o", prefix = "f"
})
