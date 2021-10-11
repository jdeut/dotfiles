wk = require('which-key')

-- tnoremap <leader><Esc> <C-\><C-n>
-- tnoremap <C-ESC> <C-w><C-c>
-- The function is called `t` for `termcodes`.

local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

wk.register({
    ['<Esc>'] = { t([[<C-\><C-N>]]), [[Quit Terminal Mode]] },
    ['<leader>'] = {
        ['<Esc>'] = { t([[<C-\><C-N>:wincmd w<CR>]]), [[Quit Terminal Mode]] }
    }
},  {
    mode = 't', prefix = '<leader>'
})
