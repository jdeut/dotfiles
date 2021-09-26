t = {}

local ttl = toggleterminals.lua

local mappings = {
   r = {
       name = 'Run',
       r = { 
           ttl.run,
           'Exec in Term'
       },
       m = { 
           ttl.close,
           'Close Term'
       },
       c = { 
           function() ttl.terminal:clear() end,
           'Clear Term'
       },
       o = { 
           ttl.open,
           'Switch to Term'
       },
       i = { 
           ttl.enter,
           'Switch to Term'
       },
       ["<"] = { 
           ttl.size_inc,
           'Dec Size'
       },
       [">"] = { 
           ttl.size_dec,
           'Inc Size'
       },
       j = { [[<Cmd>FloatermNew luajit %<cr>]], 'Run with LuaJIT'}
   }
}

t.set_mappings = function()
   if string.match(vim.fn.expand('%:p'), '/%.config/nvim/.*%.lua$') then
   else
      require('which-key').register(mappings, {
          buffer = 0,
          prefix = '<localleader>'
      })
   end
end

return t

--
-- nnoremap <silent><buffer> <LocalLeader>rl
-- \   <Cmd>w <bar> FloatermNew --autoclose=0 --position=bottomright --width=80 --height=0.8 love %:h<cr>
-- nnoremap <silent><buffer> <LocalLeader>gl
-- \   <Cmd>execute "OpenBrowserSmartSearch -loveapiref ".expand("<cword>")<cr>
-- nnoremap <silent><buffer> <LocalLeader>hl
-- \   <Cmd>execute "help love-".substitute(expand("<cWORD>"), "(.*$", "", "") <bar>
-- \   wincmd L<cr>

