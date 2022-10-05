local t = {}

t.config = {
   templdir = vim.fn.stdpath('config') .. '/templates/'
}

t.templ = {
   {
      pattern = [[Beamer/Subfiles/.*tex$]],
      templ = [[tex/Beamer/Subfiles.tex]]
   }
}

if not vim.g.skeleton_loaded then
   vim.g.skeleton_loaded = true

   vim.cmd([[
      augroup template
      autocmd!
      autocmd BufNewFile * lua require'skeleton'.load_skeleton()
      augroup END
   ]])
end

t.load_skeleton = function()
   local path = vim.fn.expand('<afile>')

   -- local dir = vim.fn.fnamemodify(path, ':.:h')
   -- require'Fn.helper'.gxmessage(path)

   for _,v in ipairs(t.templ) do
      if v.pattern then
         if string.gmatch(path, v.pattern) then

            if not v.templ then
               print('no template defined')
               return
            end


            if type(v.templ) == 'function' then
               -- require'Fn.helper'.gxmessage(v.templ .. 'ist a function')
               vim.fn.append(0, v.templ())
            elseif type(v.templ) == 'string' then

               -- require'Fn.helper'.gxmessage(
               --    v.templ .. 'is a string' .. templpath .. '\n' ..
               --    vim.fn.filereadable(templpath)
               -- )
               local templpath = t.config.templdir .. v.templ

               -- require'Fn.helper'.gxmessage(templpath .. 'ist a path')

               if vim.fn.filereadable(templpath) == 1 then
                  -- require'Fn.helper'.gxmessage(v.templ .. 'ist a path')
                  vim.cmd('0read ' .. templpath)
               else
                  -- require'Fn.helper'.gxmessage(v.templ .. 'is text')
                  vim.fn.append(0, v.templ)
               end
            else
               -- require'Fn.helper'.gxmessage(type(v.templ))
            end
         end
      end
   end
end

return t
