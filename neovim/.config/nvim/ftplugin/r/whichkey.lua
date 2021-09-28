-- "lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 
-- "au FileType rnoweb exe "normal ßrf\<CR>"

local mappings = {
    t = {
        name = 'test',
        t = {[[<Cmd>RSend Q<CR>:w<CR>:RTestPackage<cr>]], 'test package'}
    }
}

require('which-key').register(
    mappings, {
        buffer = 0,
        prefix = '<localleader>'
    }
)
