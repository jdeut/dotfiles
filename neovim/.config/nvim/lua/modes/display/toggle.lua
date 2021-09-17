job = require('plenary.job')

local t = {}

t.toggle = function()

    local templ = [[bufnr: %i
filetype: %s
foldclose: %s
]]

    local bufnr = vim.api.nvim_get_current_buf()

    --local state_fc = vim.api.nvim_buf_get_option(bufnr, 'foldclose')
    local state_fo = vim.api.nvim_get_option('foldopen')
    local state_fc = vim.api.nvim_get_option('foldclose')
    local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

    job:new({ 
        command = 'gxmessage',
        args = { string.format(templ, bufnr, filetype, state_fc) }
    }):sync()

    local n_state_fc = (state_fc == 'all') and '' or 'all'
    -- (state_fc == 'all') ? '' : 'all'
    local n_state_fo = (state_fc == 'all') and '' or 'all'

    local state_fo = vim.api.nvim_get_option('foldopen')
    local state_fc = vim.api.nvim_get_option('foldclose')

    job:new({ 
        command = 'gxmessage',
        args = { string.format('foldopen:%s\nfoldclose:%s', n_state_fo, n_state_fc) }
    }):sync()

    vim.api.nvim_set_option('foldclose', n_state_fc)
    vim.api.nvim_set_option('foldopen', n_state_fc)
end

return t
