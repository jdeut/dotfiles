-- "lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 
-- "au FileType rnoweb exe "normal ßrf\<CR>"

local mappings = {
    h = {[[<Plug>RHelp]], 'RHelp'},
    r = {
        name = 'Nvim-R',
        f = {[[<Plug>RStart]], 'Rstart'},
        s = {[[<Plug>RStop]], 'Rstop'},
        q = {[[<Plug>RClose]], 'Rclose'}
    },
    a = {
        name = '',
        f = {[[<Plug>RSendFile]], 'RSendFile'},
        s = {[[<Plug>RStop]], 'Rstop'},
        q = {[[<Plug>RClose]], 'Rclose'}
    }
}

require('which-key').register(
    mappings, {
        buffer = 0,
        prefix = '<localleader>'
    }
)
