
local t = {}


t.windowclose = function() 
    ret = vim.fn.win_findbuf(vim.fn.winbufnr(0))
    if vim.fn.winnr('$') == 1 and #ret == 1 then
       vim.cmd('bd!')
    elseif vim.fn.winnr('$') == 1 then
       vim.cmd('tabclose')
    else
       vim.cmd('silent! wincmd c')
    end
end

return t
