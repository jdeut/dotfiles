local t = {}

t.windowclose = function()
   local ret = vim.fn.win_findbuf(vim.fn.winbufnr(0))
   if vim.fn.winnr('$') == 1 and #ret == 1 then
      vim.cmd('bd!')
   elseif vim.fn.winnr('$') == 1 then
      vim.cmd('tabclose')
   else
      vim.cmd('silent! wincmd c')
   end
end

t.get_screen_cursor_position = function()
   -- local bufnr = vim.api.nvim_get_current_buf
   -- local win_id = vim.api.nvim_win_get_number(0)
   local pos = vim.fn.getcurpos()
   local wpos = vim.api.nvim_win_get_position(0)
   local row, col = pos[2], pos[5]
   local wrow, wcol = wpos[1], wpos[2]
-- [0, lnum, col, off, curswant]
   return row+wrow, col+wcol
end

t.gxmessage = function(text)
   require('plenary.job'):new({
      command = 'gxmessage',
      args = {text}}
   ):sync()
end

return t
