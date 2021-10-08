wk = require("which-key")

local n_openbrowser_query = function(s) 
    return { 
        [[:OpenBrowserSmartSearch -]] ..  s ..  [[ ]] , 
        s,
        silent = false
    } 
end

local n_openbrowser_cword = function(s) return { 
    [[<Cmd>execute "OpenBrowserSmartSearch -]] ..  s ..
    [[ " . expand('<cword>')<CR>]] , s
} end

local v_openbrowser_cword = function(s) return { 
        [[<Esc>:OpenBrowserSmartSearch -]] ..  s ..
        [[ "<C-r>=init_custom_fn#get_selected_text()<CR>"<CR>]] , s
} end

local v_openbrowser = function(s) return { 
        [[<Esc>:OpenBrowserSmartSearch -]] ..  s ..
        [[ <C-r>=init_custom_fn#get_selected_text()<CR>]] , s
} end

wk.register({
    o = {
        name = 'Browser Search',
        g = n_openbrowser_cword('google'),
        b = n_openbrowser_cword('googlebooks'),
        s = n_openbrowser_cword('googlescholar'),
        w = n_openbrowser_cword('wortbuch'),
        e = n_openbrowser_cword('sematicscholar'),
        i = n_openbrowser_cword('github'),
        ['<S-g>'] = n_openbrowser_query('google'),
        ['<S-b>'] = n_openbrowser_query('googlebooks'),
        ['<S-s>'] = n_openbrowser_query('googlescholar'),
        ['<S-w>'] = n_openbrowser_query('wortbuch'),
        ['<S-e>'] = n_openbrowser_query('sematicscholar'),
        ['<S-i>'] = n_openbrowser_query('github')
    }
}, {
    mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})

wk.register({
    o = {
        name = 'Browser Search',
        g = v_openbrowser_cword('google'),
        b = v_openbrowser_cword('googlebooks'),
        s = v_openbrowser_cword('googlescholar'),
        w = v_openbrowser_cword('wortbuch'),
        e = v_openbrowser_cword('sematicscholar'),
        i = v_openbrowser_cword('github'),
        G = v_openbrowser('google'),
        B = v_openbrowser('googlebooks'),
        S = v_openbrowser('googlescholar'),
        W = v_openbrowser('wortbuch'),
        E = v_openbrowser('sematicscholar'),
        I = v_openbrowser('github')
    },
}, {
    mode = "v", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})
