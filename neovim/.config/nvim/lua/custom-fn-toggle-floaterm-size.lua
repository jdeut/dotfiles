
local toggle_floaterm_size = {}

local t = toggle_floaterm_size

t.test = function ()
    vim.fn.printf("asdasd")
end

t.asd = function ()
    local width
    local height

    local bufnr = vim.fn.bufnr()


    --vim.fn['floaterm#config#get'](
        --bufnr, "width"
    --)
end

toggle_floaterm_size = t
