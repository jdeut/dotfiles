-- "lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<sfile>:p')}}):sync() 

local mappings = {
    a = {
        name = 'Make',
        a = { function()
                vim.fn.RWeave('nobib', 1, 1)
            end, 'RMakePDFK'
        },
        k = { function()
                vim.fn.RWeave('nobib', 1, 0)
            end, 'Knit'
        },
        f = { vim.fn.RKnit , 'Knit'}
    },
    c = {
        name = 'Chunk',
        e = {[[<Plug>RESendChunk]], 'RESendChunk'},
        p = {[[<Cmd>call RnwPreviousChunk() <bar> normal zt<cr>]], 'Prev Chunk'},
        n = {[[<Cmd>call RnwNextChunk() <bar> normal zt<cr>]], 'Next Chunk'}
    },
    f = {
        vim.fn.SyncTeX_forward, 'SynctexForwar'
    },
    g = {
        name = 'G',
        q = {[[m`vipgq``]], 'RESendChunk'},
    },
    l = {
        name = '',
        v = { function() vim.fn.ROpenPDF('Get Master') end, 'open pdf' }
    },
}

require('which-key').register(
    mappings, {
        buffer = 0,
        prefix = '<localleader>'
    }
)
