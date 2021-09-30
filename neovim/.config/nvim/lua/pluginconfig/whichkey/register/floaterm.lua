wk = require("which-key")

wk.register({
    f = {
        name = '',
        f = { [[<Cmd>FloatermNew! cd %:p:h ; clear<CR>]], "Floaterm in current Dir"}
    }
}, {
    mode = "n", prefix = "<leader>"
})
