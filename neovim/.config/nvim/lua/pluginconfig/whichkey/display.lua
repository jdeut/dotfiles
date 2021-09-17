local wk = require("which-key")

local p = {}

p.set_brightness = function(per)
    require('plenary.job'):new({
        command = [[brightnessctl]],
        args = { 
            [[s]],
            per .. [[%]]
        }
    }):sync()
end

p.togl_scrolloff = function()
    if vim.wo.scrolloff > 2 then
        vim.wo.scrolloff = 2
    else
        vim.wo.scrolloff = 200
        vim.cmd("silent normal M")
    end
    vim.cmd("setlocal scrolloff?")
end

local set_font = function(height) 
    if height ~= nil then
        return {
            [[:set guifont=<C-r>=substitute(g:guifont_start, ' ', '\\ ', 'g')<CR>:h]] ..
            height ..
            [[<CR>]],
            [[set fontsize ]] .. height
        }
    else
        return {
            [[:set guifont=<C-r>=substitute(g:guifont_start, ' ', '\\ ', 'g')<CR>:h]] ..
            10.5 ..
            [[<CR>]],
            [[set fontsize ]] .. 10.5
        }
    end
end

wk.register({
    d = {
        name = 'Display',
        r = { [[<Cmd>set splitright! splitright?<cr>]], [[Togl Splitright]] },
        n = { [[<Cmd>setlocal relativenumber! relativenumber?<cr>]], [[Togl Relnumber]] },
        w = { [[<Cmd>set wrap! wrap?<cr>]], [[Togl Wrap]] },
        h = { [[<Cmd>set hlsearch! hlsearch?<cr>]], [[Togl Hlsearch]] },
        s = { [[<Cmd>lua require'pluginconfig.mappings.display'.togl_scrolloff()<CR><cr>]], [[Togl Scrolloff]] },
        b = {
            name = 'Brightness',
            ["1"] = { [[<Cmd>lua require'pluginconfig.mappings.display'.set_brightness(0)<CR>]], [[0 %]] },
            ["2"] = { [[<Cmd>lua require'pluginconfig.mappings.display'.set_brightness(2)<CR>]], [[2 %]] },
            ["3"] = { [[<Cmd>lua require'pluginconfig.mappings.display'.set_brightness(100)<CR>]], [[100 %]] }
        },
        c = {
            name = 'Cursor',
            c = { [[<Cmd>setlocal cursorcolumn! cursorcolumn?<cr>]], [[Togl Column]] },
            l = { [[<Cmd>setlocal cursorline! cursorline?<cr>]], [[Togl line]] }
        },
        f = {
            name = 'Font Size',
            t = set_font(6.7),
            l = set_font(11.7),
            h = set_font(13.8),
            f = set_font(nil)
        },
        s = {
            name = 'Colorscheme',
            ["<Space>"] = { [[<Cmd>colorscheme srcery<CR>]], [[srcery]] },
            s = { [[<Cmd>colorscheme shirotelin<CR>]], [[shirotelin]] },
            d = { [[<Cmd>colorscheme delek<CR>]], [[delek]] }
        },
    }
}, {
    mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true
})

return p
