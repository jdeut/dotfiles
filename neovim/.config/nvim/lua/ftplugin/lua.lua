local Terminal = require('toggleterm.terminal').Terminal
local wk = require('which-key')

--_G.ftplugin_lua_includeexpr = require'ftplugin.lua.includeexpr'

--vim.bo.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
--vim.bo.includeexpr = 'v:lua.ftplugin_lua_includeexpr(v:fname)'

if toggleterminals.lua == nil then

    assert(toggleterminals)

    toggleterminals.lua = {
        config = {
            size = 100
        }
    }

    toggleterminals.lua.init = function()
        vim.env.PROMPT = "sss"
        return Terminal:new({
            direction = "vertical",
            hidden = false
        })
    end

    toggleterminals.lua._set_size = function()
        local t = toggleterminals.lua

        local term_winnr = vim.fn.bufwinnr(t.terminal.bufnr)

        vim.cmd(term_winnr .. "wincmd w")
        vim.cmd("vertical resize " .. t.config.size)
        --if vim.o.winwidth > t.config.size then
            --vim.o.winminwidth = t.config.size
            --vim.o.winwidth = t.config.size
        --else
            --vim.o.winwidth = t.config.size
            --vim.o.winminwidth = t.config.size
        --end
    end
    
    toggleterminals.lua.size_inc = function ()
        local t = toggleterminals.lua
        local i_bufnr = vim.fn.bufnr()
        if t.config.size < 0.8 * vim.o.columns then
            t.config.size = t.config.size + 25
        end
        t._set_size()
        if  i_bufnr ~= t.terminal.bufnr then
            vim.cmd(vim.fn.bufwinnr(i_bufnr) .. "wincmd w")
        end
    end

    toggleterminals.lua.size_dec = function ()
        local t = toggleterminals.lua
        local i_bufnr = vim.fn.bufnr()
        if t.config.size > 0.2 * vim.o.columns then
            t.config.size = t.config.size - 25
        end
        t._set_size()
        if  i_bufnr ~= t.terminal.bufnr then
            vim.cmd(vim.fn.bufwinnr(i_bufnr) .. "wincmd w")
        end
    end

    toggleterminals.lua.set_size = function (size)
        toggleterminals.lua.config.size = size 
        toggleterminals.lua._set_size()
    end

    _G.toggleterminals_lua_prev_keymap = function ()
        local term_winnr = vim.fn.bufwinnr(toggleterminals.lua.terminal.prevbufnr)
        assert(term_winnr)
        vim.cmd(term_winnr .. "wincmd w")
    end

    toggleterminals.lua._open = function ()
        local term_bufnr = toggleterminals.lua.terminal.bufnr
        toggleterminals.lua.terminal.prevbufnr = vim.fn.bufnr()
        local term_winnr = nil

        if vim.fn.bufexists(term_bufnr) == 1 then
            term_winnr = vim.fn.bufwinnr(term_bufnr)

            if term_winnr < 0 then
                vim.cmd("vertical rightbelow sbuffer " .. term_bufnr)
            end
        else
            toggleterminals.lua.terminal:open()
            term_bufnr = toggleterminals.lua.terminal.bufnr
        end

        vim.api.nvim_buf_set_keymap(
            term_bufnr,
            't',
            '<C-o>',
            '<Cmd>call v:lua.toggleterminals_lua_prev_keymap()<CR>',
            { noremap = true }
        )
        toggleterminals.lua._set_size()
    end

    toggleterminals.lua.open = function ()
        toggleterminals.lua._open()
        prev_winnr = vim.fn.bufwinnr(toggleterminals.lua.terminal.prevbufnr)
        if prev_winnr > 0 then
            vim.cmd(prev_winnr .. "wincmd w")
        end
    end

    toggleterminals.lua.enter = function()
        toggleterminals.lua._open() 

        local term_bufnr = toggleterminals.lua.terminal.bufnr
        local term_winnr = vim.fn.bufwinnr(term_bufnr)

        vim.cmd(term_winnr .. "wincmd w")
        vim.cmd("normal! A")
    end

    toggleterminals.lua.save_size = function ()

        assert(toggleterminals.lua.terminal)
        local t = toggleterminals.lua
        local term_bufnr = t.terminal.bufnr

        if vim.fn.bufexists(term_bufnr) == 0 then
            return
        end

        term_winnr = vim.fn.bufwinnr(term_bufnr)

        if term_winnr > 0 then
            t.config.size = vim.fn.winwidth(term_winnr)
        end
    end

    toggleterminals.lua.close = function()

        if vim.fn.bufexists(toggleterminals.lua.terminal.bufnr) == 0 then
            return
        end

        toggleterminals.lua.save_size()
        term_bufnr = toggleterminals.lua.terminal.bufnr
        term_winnr = vim.fn.bufwinnr(term_bufnr)
        if term_winnr > 0 then
            vim.cmd(term_winnr .. "close")
        end
    end

    toggleterminals.lua.run = function()

        assert(toggleterminals.lua.terminal)

        local t    = toggleterminals.lua
        local dir  = vim.fn.getcwd()
        local file = vim.fn.expand("%")

        t.close()
        t._open()

        vim.cmd("normal! G")
        t.terminal:send(string.format("cd %s", dir), false)
        t.terminal:send("lua5.3 " .. file, false)

        local prevbuf_winnr = vim.fn.bufwinnr(t.terminal.prevbufnr)

        vim.cmd(prevbuf_winnr .. "wincmd w")
    end

    toggleterminals.lua.terminal = toggleterminals.lua.init()
end


if string.match(vim.fn.expand('%:p'), '/%.config/nvim/.*%.lua$') then
    --wk.register({
        --r = {
            --name = '',
            --e = { [[<Cmd>lua require'ftplugin.lua'.reload()<cr>]], 'Reload'},
        --}
    --},  {
        --mode = "n", prefix = "<localleader>",
        --buffer = buf, silent = true, noremap = true
    --})
    --package.path = package.path .. 
                   --[[;/home/johannes/.config/nvim/lua/?.lua]]
else
    wk.register({
        r = {
            name = '',
            r = { 
                [[<Cmd>lua toggleterminals.lua.run()<Cr>]],
                'Exec in Term'
            },
            m = { 
                [[<Cmd>lua toggleterminals.lua.close()<Cr>]],
                'Close Term'
            },
            c = { 
                [[<Cmd>lua toggleterminals.lua.terminal:clear()<Cr>]],
                'Clear Term'
            },
            o = { 
                [[<Cmd>lua toggleterminals.lua.open()<Cr>]],
                'Switch to Term'
            },
            i = { 
                [[<Cmd>lua toggleterminals.lua.enter()<Cr>]],
                'Switch to Term'
            },
            ["<"] = { 
                [[<Cmd>lua toggleterminals.lua.size_inc()<Cr>]],
                'Dec Size'
            },
            [">"] = { 
                [[<Cmd>lua toggleterminals.lua.size_dec()<Cr>]],
                'Inc Size'
            },
            j = { [[<Cmd>FloatermNew luajit %<cr>]], 'Run with LuaJIT'}
        }
    },  {
        mode = "n", prefix = "<localleader>",
        buffer = buf, silent = true, noremap = true
    })
end
