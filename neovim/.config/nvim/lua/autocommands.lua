vim.api.nvim_create_augroup('xxuser', {clear = true})

vim.api.nvim_create_autocmd(
   { 'BufNewFile', 'BufRead', 'BufFilePre' },
   {
      group = 'xxuser',
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

   -- function! s:update_oldfiles(file)
   --     if !exists('v:oldfiles')
   --         return
   --     endif
   --     let idx = index(v:oldfiles, a:file)
   --     if idx != -1
   --         call remove(v:oldfiles, idx)
   --     endif
   --     call insert(v:oldfiles, a:file, 0)
   -- endfunction
   --
   -- autocmd startify BufNewFile,BufRead,BufFilePre *
   --     \ call s:update_oldfiles(expand('<afile>:p'))
