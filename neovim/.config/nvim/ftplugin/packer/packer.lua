vim.wo.winhighlight = 'Normal:WhichKeyGroup'

vim.defer_fn( function()
        print('Timeout')
        vim.wo.wrap = true
    end,
    100
)
