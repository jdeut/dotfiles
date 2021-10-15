wk = require("which-key")

wk.register({
    w = { [[<Plug>WordMotion_w]], "WordMotion w"},
    e = { [[<Plug>WordMotion_e]], "WordMotion e"},
    b = { [[<Plug>WordMotion_b]], "WordMotion b"},
    g = {
        name = 'g',
        e = { [[<Plug>WordMotion_ge]], "WordMotion ge"}
    }
}, {
    mode = "n", prefix = "'"
})
