local t = {}

local state = {}
local w_state = {
    width = 0.8,
    height = 0.7,
    position = "center"
}

t.toggle = function ()

    local bufnr = vim.fn.bufnr()

    local width = vim.fn['floaterm#config#get'](
        bufnr, "width"
    )

    local mode = vim.fn.mode()

    if width ~= w_state.width then

        state.width = width

        state.height = vim.fn['floaterm#config#get'](bufnr, "height")
        state.position = vim.fn['floaterm#config#get'](bufnr, "position")

        vim.fn['floaterm#update'](w_state)

    else
        vim.fn['floaterm#update'](state)
    end

    if mode == 'n' then
        vim.cmd('stopinsert')
    end
end

return t
