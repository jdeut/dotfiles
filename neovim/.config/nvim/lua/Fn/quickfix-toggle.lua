local Job = require'plenary.job'
local t = {}

vim.g.quickfix_is_open = 0

t.toggle = function ()

    -- Job:new({ command = 'gxmessage', args = {'DIE'} }):sync()

    if vim.g.quickfix_is_open == 1 then
        vim.cmd("cclose")
        vim.g.quickfix_is_open = 0
    else
        vim.cmd("copen")
        vim.g.quickfix_is_open = 1

        vim.cmd("wincmd J")
        vim.cmd("wincmd p")
    end
end

return t
