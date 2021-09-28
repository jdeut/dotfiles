-- "lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 

local mappings = {
    c = {
        name = 'Chunk',
        e = {[[<Plug>RESendChunk]], 'RESendChunk'},
        p = {[[<Cmd>call RnwPreviousChunk() <bar> normal zt<cr>]], 'Prev Chunk'},
        n = {[[<Cmd>call RnwNextChunk() <bar> normal zt<cr>]], 'Next Chunk'}
    },
    a = {
        name = 'Knit',
        a = {
            function()
                vim.fn.RWeave('nobib', 1, 0)
                vim.fn.RWeave('nobib', 1, 1)
            end, 'RMakePDFK'
        },
        f = { vim.fn.RKnit , 'Knit'}
    }
}

require('which-key').register(
    mappings, {
        buffer = 0,
        prefix = '<localleader>'
    }
)
