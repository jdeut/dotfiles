vim.api.nvim_create_autocmd(
   { 'BufNewFile', 'BufRead', 'BufFilePre' },
   {
      group = vim.api.nvim_create_augroup('xxuser', {clear = true}),
      pattern = '*',
      callback = function()
         local afile = vim.fn.expand('<afile>:p')
         --
         if not vim.fn.exists('v:oldfiles') then
            return
         end
         local idx = vim.fn.index(vim.v.oldfiles, afile)

         -- require'myhelper'.gxmessage(idx .. ' ' .. afile .. "\n" .. table.concat(vim.v.oldfiles, "\n"))

         if idx ~= -1 then
            vim.v.oldfiles[idx] = nil
         end
         --
         -- vim.notify(vim.v.oldfiles[1], vim.log.levels.ERROR)
         table.insert(vim.v.oldfiles, 1, afile)
      end
   }
)


-- "══════════════════════════════════════════════════════════════════
-- " Autocommands (FileType specific settings, mappings, etc.)
-- "
-- augroup MY__
--     au!
--
--     "au BufRead * let b:lexima_disable = 0
--     "au BufNew * lua require('plenary.job'):new({command = 'gxmessage', args = { vim.fn.expand('<afile>:p')}}):sync()
--
--     "au BufEnter * if &ft ==# 'help' | normal "zR" | wincmd L | vert resize 85 | endif
--     au TextYankPost *
--     \   silent! lua vim.highlight.on_yank{
--     \       higroup = "IncSearch",
--     \       timeout = 500,
--     \       on_macro = true
--     \ }
--
--     " press <C-c> to leave the command-line window
--     autocmd CmdwinEnter * noremap <buffer> <C-c> <C-\><C-N>
--
--     " set ` mark to cursor position at mode change from [*] -> [visual]
--     au ModeChanged *:[vV]* lua p = vim.api.nvim_win_get_cursor(0) vim.api.nvim_buf_set_mark(0, '`', p[1], p[2], {})
--     " test with -->
--     "   au ModeChanged * echomsg printf('the old mode was: %s, the new mode is: %s', v:event.old_mode, v:event.new_mode)
--
--     "autocmd WinEnter * lua
--     "\   local fts = { 'denite', 'denite-filter' } ;
--     "\   local ret = vim.tbl_contains(fts, vim.bo.filetype)
--     "\   if ret == false then
--     "\       vim.wo.cursorline = true
--     "\       vim.defer_fn(function() vim.wo.cursorline = false end, 3000)
--     "\   else
--     "\   end
--
--     "═══════════════════════════════════════════════════════════════
--     " Diff
--
--     au OptionSet diff setlocal nonumber norelativenumber
--
--     "═══════════════════════════════════════════════════════════════
--     " Terminal
--
--     "au TermOpen * call SetTerminalColors()
--     au TermOpen * setlocal winhighlight=Normal:Floaterm
--     au TermOpen * setlocal scl=no
--     au TermOpen * setlocal nonumber
--     au TermOpen * setlocal nospell
--     "au TermOpen * noremap <buffer> <ScrollWheelUp>     <C-b>
--     "au TermOpen * noremap <buffer> <2-ScrollWheelUp>   <C-b>
--     "au TermOpen * noremap <buffer> <3-ScrollWheelUp>   <C-b>
--     "au TermOpen * noremap <buffer> <4-ScrollWheelUp>   <C-b>
--     "au TermOpen * noremap <buffer> <ScrollWheelDown>   <C-f>
--     "au TermOpen * noremap <buffer> <2-ScrollWheelDown> <C-f>
--     "au TermOpen * noremap <buffer> <3-ScrollWheelDown> <C-f>
--     "au TermOpen * noremap <buffer> <4-ScrollWheelDown> <C-f>
--     "au TermOpen * noremap <buffer> <RightMouse> :startinsert<cr>
--     "au TermOpen * noremap <buffer> <RightRelase> <nop>
--     "au TermOpen * noremap <buffer> <RightDrag> <nop>
--     "au TermOpen * startinsert
--     "au TermOpen * nnoremap <buffer> <leader>oc <Cmd>bd!<cr>
--     "au WinEnter term://* startinsert
--
-- augroup END
