local job = require'plenary.job'
local helper = require'myhelper'
local path = require'plenary.path'

local function args()
   local fn = 'main.lua'
   return({
      path.new(fn):exists() and fn or vim.fn.expand('%')
   })
end

local mappings = {
   ['<C-q>'] = { function()
         print(vim.inspect(args()))
      end, 'asdasd'
   },
   ['<C-t>'] = { function()
         -- tt():jump_to_term_append()
      end, 'Append', silent = true
   },
   ['<localleader>'] = {
      name = 'Lua Specific',
      r = {
         name = 'Run',
         k = {
            function()
               -- tt():kill_descendant()
            end,
            'Kill lua instances'
         },
         r = { function()
               -- tt():kill_descendant()
               -- tt():send({
               --    cmd = 'lua5.3',
               --    args = args()
               -- })
            end,
            'Exec in Term'
         },
         t = { function()
               -- tt():kill_descendant()

               local path = vim.fn.expand('%:p:h')

               path = vim.fn.split(path, '/')

               if path[#path] == 'spec' then
                  path[#path] = nil
               end

               path = [[/]] .. vim.fn.join(path, '/')

               vim.api.nvim_notify(path, vim.log.levels.INFO, {})

               -- tt():send({
               --    cmd = 'busted',
               --    args = { '-v', '-C', path }
               -- })
            end, 'Test with busted', silent = true
         },
         l = { function()
               -- tt():kill_descendant()
               -- tt():send({
               --    cmd = 'env love',
               --    args = { vim.fn.expand('%:p:h') }
               -- })
            end, 'Run with Love2D', silent = true
         },
         j = { function()
               -- tt():kill_descendant()
               -- tt():send({
               --    cmd = 'env LUA_PATH=$LUA_PATH_5_1 LUA_CPATH=$LUA_CPATH_5_1 luajit',
               --    args = args()
               -- })
            end, 'Run with LuaJIT', silent = true
         },
         w = {
            function()
               -- tt():send({
               --    cmd = 'env WIREPLUMBER_DEBUG=2 wpexec',
               --    args = args()
               -- })
            end,
            'Wireplumber'
         },
      },
      w = {
         name = 'Search',
         w = { function()
               local s = vim.fn.expand('<cword>')

               vim.fn.jobstart([[devhelp --search=]] .. s)
            end, 'LGI devhelp'
         }
      }
   }
}

if string.match(vim.fn.expand('%:p'), '/%.config/nvim/.*%.lua$') then
else
    require('which-key').register(mappings, {
        buffer = 0,
        prefix = '',
        silent = true
    })
end

-- nnoremap <silent><buffer> <LocalLeader>rl
-- \   <Cmd>w <bar> FloatermNew --autoclose=0 --position=bottomright --width=80 --height=0.8 love %:h<cr>
-- nnoremap <silent><buffer> <LocalLeader>gl
-- \   <Cmd>execute "OpenBrowserSmartSearch -loveapiref ".expand("<cword>")<cr>
-- nnoremap <silent><buffer> <LocalLeader>hl
-- \   <Cmd>execute "help love-".substitute(expand("<cWORD>"), "(.*$", "", "") <bar>
-- \   wincmd L<cr>

