wk = require("which-key")

local n_openbrowser = function(s) return { 
    [[<Cmd>execute "OpenBrowserSmartSearch -]] ..  s ..
    [[ " . expand('<cword>')<CR>]] , s
} end

local v_openbrowser = function(s) return { 
        [[<Esc>:OpenBrowserSmartSearch -]] ..  s ..
        [[ "<C-r>=init_custom_fn#get_selected_text()<CR>"<CR>]] , s
} end

wk.register({
    g = {
        name = 'Browser',
        g = n_openbrowser('google'),
        b = n_openbrowser('googlebooks'),
        s = n_openbrowser('googlescholar'),
        w = n_openbrowser('wortbuch'),
        e = n_openbrowser('sematicscholar'),
        i = n_openbrowser('github')
    }
}, {
    mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})

wk.register({
    g = {
        name = 'Browse',
        g = v_openbrowser('google'),
        b = v_openbrowser('googlebooks'),
        s = v_openbrowser('googlescholar'),
        w = v_openbrowser('wortbuch'),
        e = v_openbrowser('sematicscholar'),
        i = v_openbrowser('github')
    },
}, {
    mode = "v", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})
