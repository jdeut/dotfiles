-- "lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 
-- "au FileType rnoweb exe "normal ßrf\<CR>"
--

require('which-key').register({
    h = {
        function()
            vim.cmd([[Rhelp ]] .. vim.fn.expand('<cword>'))
        end,
        'RHelp'
    },
    m = {[[<Cmd>RStop<CR>]], 'Rstop'},
    r = {
        name = 'Nvim-R',
        f = {[[<Plug>RStart]], 'Rstart'},
        q = {[[<Plug>RClose]], 'Rclose'},
        o = { vim.fn.RObjBrowser, 'Object Browser'}
    },
    a = {
        name = '',
        f = {[[<Plug>RSendFile]], 'RSendFile'},
        q = {[[<Plug>RClose]], 'Rclose'}
    }
}, {
    buffer = 0,
    prefix = '<localleader>'
})

require('which-key').register({
    ['<C-[>'] = {
        function()
            local winid = vim.fn.bufwinid(vim.g.rplugin.R_bufname)
            if winid == -1 then
                vim.cmd([[vertical botright sb ]] .. vim.g.rplugin.R_bufname)
                vim.cmd([[vertical resize 60]])
                vim.cmd([[normal G]])
                vim.cmd([[wincmd w]])
            else
                vim.fn.win_execute(winid, 'hide')
            end
        end, 'R terminal toggle'
    }
}, {
    buffer = 0,
    prefix = ''
})
