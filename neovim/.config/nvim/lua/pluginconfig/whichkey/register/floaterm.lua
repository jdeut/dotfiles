-- wk = require("which-key")
--
-- wk.register({
--     f = {
--         name = 'Floaterm',
--         ['<C-f>'] = { [[<Cmd>FloatermNew! cd %:p:h ; clear<CR>]], "NewFloaterm in Cwd"},
--         f = { [[<Cmd>FloatermNew --position=top --width=81 --height=0.7<CR>]], "NewFloaterm in Cwd"},
--         i = { require("Fn/floaterm-toggle-size").toggle, "Toggle Size"}
--     }
-- }, {
--     mode = "n", prefix = "<leader>"
-- })