local function tt()
   return(toggleterminals.default)
end

local mappings = {
   r = {
      name = 'Run',
      r = { 
         function()
            tt():send({cmd = 'lua5.3'})
         end,
         'Exec in Term'
      },
      j = { function()
            tt():send({cmd = 'env LUA_PATH=$LUA_PATH_5_1 LUA_CPATH=$LUA_CPATH_5_1 luajit'})
            -- local filename = vim.fn.expand('%')
            -- vim.cmd([[FloatermNew --name=luajit]])
            -- vim.cmd([[FloatermSend --name=luajit export LUA_PATH=$LUA_PATH_5_1]])
            -- vim.cmd([[FloatermSend --name=luajit export LUA_CPATH=$LUA_CPATH_5_1]])
            -- vim.cmd([[FloatermSend --name=luajit luajit ]] .. filename)
         end, 'Run with LuaJIT'
      }
   }
}

if string.match(vim.fn.expand('%:p'), '/%.config/nvim/.*%.lua$') then
else
    require('which-key').register(mappings, {
        buffer = 0,
        prefix = '<localleader>'
    })
end

-- nnoremap <silent><buffer> <LocalLeader>rl
-- \   <Cmd>w <bar> FloatermNew --autoclose=0 --position=bottomright --width=80 --height=0.8 love %:h<cr>
-- nnoremap <silent><buffer> <LocalLeader>gl
-- \   <Cmd>execute "OpenBrowserSmartSearch -loveapiref ".expand("<cword>")<cr>
-- nnoremap <silent><buffer> <LocalLeader>hl
-- \   <Cmd>execute "help love-".substitute(expand("<cWORD>"), "(.*$", "", "") <bar>
-- \   wincmd L<cr>

