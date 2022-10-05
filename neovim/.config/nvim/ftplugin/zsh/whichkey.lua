local mappings = {
    ['<C-l>'] = { function()
            vim.cmd([[w]])
            vim.cmd([[cq]])
        end, 'Write and Quit'
    }
}

require('which-key').register(mappings, {
    mode = 'n',
    buffer = 0,
    prefix = ''
})

require('which-key').register(mappings, {
    mode = 'i',
    buffer = 0,
    prefix = ''
})
