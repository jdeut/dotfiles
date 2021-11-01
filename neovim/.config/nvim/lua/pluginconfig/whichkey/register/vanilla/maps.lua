wk = require("which-key")

local xn_related = {
   ['<DEL>']      = { [["+]], 'Select + Reg' },
   ['<DEL><DEL>'] = { [["+y]], 'Yank + Reg' },
   ['<Space>']    = { [[:]], 'Enter Command-Line Mode', silent  = false},
   ['<leader>']   = {
      e = {
         name = 'Edit/Sub',
         e    = { [[:%s###c<Left><Left><Left>]], [[Substitute]], silent = false },
         w    = { [[:%s#=expand('<cword>')<cr>##c<Left><Left>]], [[ ]], silent = false }
      }
   }
}

for _, v in ipairs({'x', 'n'}) do
   wk.register(xn_related,  { mode = v })
end

wk.register( {
   ['<C-Space>'] = { function() vim.cmd([[wincmd p]]) end,  [[Go to previous window]] },
},  { mode = 't' })

wk.register( {
   ['<C-Space>'] = { function()
         vim.cmd([[wincmd p]])

         if vim.bo.buftype == 'terminal' then
               vim.cmd([[startinsert]])
         end
      end,  [[Go to previous window]]
   },
}, { mode = 'n' })


wk.register({
   ['/'] = {
      name = 'localleader',
      ['/']    = { [[/]], 'Search', silent = false }
   },
   ['<F5>']  = { [[:write<cr>:silent Reload<cr>]], 'Reload settings' },
   ['<F2>']  = { function()
         local line, col, r = vim.fn.line('.'), vim.fn.col('.'), {}
         -- print(line .. [[  ]] .. col)

         print(vim.fn.synIDattr(vim.fn.synID(line, col, true), 'name'))
      end, 'Show Syntax Info'
   },
   g = {
      n = { vim.lsp.diagnostic.goto_next, 'next error'},
      N = { vim.lsp.diagnostic.goto_prev, 'prev error'},
      i = { vim.lsp.buf.implementation, 'code action'},
      d = { vim.lsp.buf.definition, 'go to definition'},
      D = { vim.lsp.buf.declaration, 'go to definition'},
      h = { vim.lsp.buf.hover, 'hover'},
      r = { vim.lsp.buf.references, 'references'},
      s = { vim.lsp.buf.rename, 'rename'},
      l = {
         name = 'Linewise Put',
         p = { function()
               vim.cmd([[put ]] .. vim.v.register)
               vim.cmd([[normal `[=`]`] ]])
            end, 'put'
         }
      }
   }
}, { mode = 'n' })

wk.register({
   [':'] = {
      name = 'Exec',
      n    = { [[<Cmd>silent !xdg-open %:p:h<CR>]], 'Nautilus' },
      g    = { [[<Cmd>lua require('plenary.job'):new({command = 'gitg'}):start()<CR>]], 'Gitg' }
   },
   q = {
      name = 'Quickfix',
      q    = { function()
            require('Fn/quickfix-toggle').toggle()
         end, 'toggle'
      },
      n    = { [[<cmd>cnext<CR>]], 'next entry'},
      p    = { [[<cmd>cprev<CR>]], 'previous entry'},
   }
},  { mode = 'n', prefix = '<leader>' })