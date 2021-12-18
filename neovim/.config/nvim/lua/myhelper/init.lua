local t = {}

t.git_get_root = function()
   local ret, dir

   require'plenary.job':new({
      command = 'git',
      cwd = vim.fn.getcwd(),
      args = { 'rev-parse', '--show-toplevel' },
      on_exit = function(j, ret_)
         ret = ret_ == 0 and ret_ or nil
         dir = ret and table.concat(j:result()) or nil
      end,
   }):sync()

   return dir
end

t.git_is_valid = function()
   return t.git_get_root() and true or false
end

t.git_get_root_or_cwd  = function()
   return t.git_is_valid() and t.git_get_root() or vim.fn.expand('%:p:h')
end


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

t.feedkeys_after_termcodes = function(key)
   local tkey = vim.api.nvim_replace_termcodes(key, 'n', {})
   vim.api.nvim_feedkeys(tkey, 'n', {})
end

t.gxmessage = function(text)
   require('plenary.job'):new({
      command = 'gxmessage',
      args = {text}}
   ):sync()
end

return t
