wk = require("which-key")

wk.register({
    name = 'Hop',

    ["1"] = { [[<Cmd>Denite -split=tab -buffer-name=files -path=~/.config/nvim]] ..
              [[ -matchers=matcher/ignore_current_buffer,matcher/substring]] ..
              [[ file/rec/git/tracked<cr>]], [[Nvim Config Dir]] },

    ["<leader>"] = {

        name = 'Denite',
        x = { [[:FloatermNew --name=browse_git_dirs --opener=vsplit --autoclose=2]] ..
              [[ --width=0.8 --height=0.8 <C-R>=g:nvim_config_home<CR>]] ..
              [[/shscripts/mrcgitdirs.sh<CR>]], [[Recent Projects]] },
        a = { [[<Cmd>DeniteProjectDir -split=tab -buffer-name=files -statusline]] ..
              [[ -filter-split-direction=botright -winheight=160]] ..
              [[ -matchers=matcher/ignore_current_buffer,]] ..
              [[matcher/fruzzy,matcher/ignore_globs]] ..
              [[ file/rec/git/tracked<CR>]], [[Project Dir]] },
        s = { [[<Cmd>DeniteProjectDir -buffer-name=files -winheight=35]] ..
              [[ -winwidth=69 -matchers=matcher/ignore_current_buffer,]] ..
              [[matcher/fruzzy]], [[Project Dir 2]] },
        n = { [[<Cmd>Denite -buffer-name=files]] ..
              [[ -matchers=matcher/ignore_current_buffer file/old<CR>]],
              [[Recent Files]] },
        g = { [[:Denite grep::--<C-r>=expand("%:e")<CR>]], [[Grep Ftype]] },
        b = { [[<Cmd>Denite -matchers=matcher/ignore_current_buffer,]] ..
              [[matcher/substring buffer<CR>]], [[Buffer]] },
        d = { [[<Cmd>Denite -resume<CR>]], [[Resume]] },
        m = { [[<Cmd>Denite -winwidth=50 -quick-move=immediately]] ..
              [[ menu:custom<cr>]], [[Menu]] },
        h = { [[<Cmd>Denite help<cr>]], [[Help]] },

        [","] = { [[<Cmd>Denite -resume -cursor-pos=+1 -immediately<CR>]],
                  [[Cursor Down]] },
        ["."] = { [[<Cmd>Denite -resume -cursor-pos=-1 -immediately<CR>]],
                  [[Cursor Up]] },

        ["<space>"] = { [[<Cmd>Denite -winwidth=70 command_history<cr>]],
                        [[Command Hist]] },

        ["<leader>"] = {
            name = "Specific",
            g = { [[:DeniteCursorWord grep::]], [[Grep Generic]] },
            h = { [[<Cmd>DeniteCursorWord help<cr>]], [[Help]] }
        }
    }
},  {
    mode = "n", prefix = "<leader>", buffer = nil, silent = false, noremap = true
})
