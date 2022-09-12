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
   local tkey = vim.api.nvim_replace_termcodes(key, 'n', {}, {})
   vim.api.nvim_feedkeys(tkey, 'n', {})
end

t.get_last_visual_selection = function()
   if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
      local key = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
      vim.api.nvim_feedkeys(key, 'x', true)
   end
   local row0, col0 = unpack(vim.api.nvim_buf_get_mark(0, '<'))
   local row1, col1 = unpack(vim.api.nvim_buf_get_mark(0, '>'))
   local lines = vim.api.nvim_buf_get_lines(0, row0 - 1, row1, false)

   col1 = col1 == 2147483647 and -1 or col1 + 1

   if #lines == 1 then
      lines[1] = string.sub(lines[1], col0 + 1, col1)
   elseif #lines > 1 then
      lines[1] = string.sub(lines[1], col0 + 1, -1)
      lines[#lines] = string.sub(lines[#lines], 0, col1)
   end

   return table.concat(lines,"\n")
end

t.open_from_ext = function(f)
   local ok, bt = pcall(vim.api.nvim_buf_get_option, 0, 'buftype')

   if not ok then
      vim.api.nvim_notify([[can't open ]] .. f, vim.log.levels.ERROR, {})
   end

   if vim.fn.filereadable(f) == 0 then vim.api.nvim_notify(
         string.format(
            [['%s' doesn't exist in %s]], f, vim.fn.getcwd()
         ),
         vim.log.levels.WARN, {}
      )
      return
   end

   if bt == 'terminal' then vim.api.nvim_win_hide(0) end

   vim.cmd([[edit ]] .. f)
end

t.gxmessage = function(text)
   if type(text) == 'table' then
      text = vim.inspect(text)
   elseif text == nil then
      text = 'NIL'
   end
   

   require('plenary.job'):new({
      command = 'gxmessage',
      args    = { text }
   }):start()
end

return t
