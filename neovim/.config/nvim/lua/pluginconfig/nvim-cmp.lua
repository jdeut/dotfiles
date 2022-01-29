--require('plenary.job'):new({command = gxmessage', args = { vim.fn.expand('<afile>:p')}}):sync()
--
--

local cmp = require'cmp'

local types = require'cmp.types'

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local has_words_before = function()
   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup {
   mapping = {}
}

cmp.setup {
   preselect = types.cmp.PreselectMode.Item,
   completion = {
      keyword_pattern = [[[=A-Za-zäüöÄÜÖ=][=0-9A-Za-zäüöÄÜÖß=]*\%([-_][=0-9A-Za-zäüöÄÜÖß=]*\)*]],
      keyword_length  = 1
   },
   documentation = {
      border = 'double',
      winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat'
   },
   mapping = {
      ['<C-d>'] = function(fallback)
               if cmp.visible() then
                  cmp.scroll_docs(4)
               else
                  fallback()
               end
            end,
      ['<C-u>'] = function(fallback)
            if cmp.visible() then
               cmp.scroll_docs(-4)
            else
               fallback()
            end
         end,
      ['<C-e>'] = cmp.mapping({i = cmp.abort, c = cmp.close }),
      ['<C-s>'] = function()
            cmp.complete{ config = {
                  sources = { { name = 'ultisnips' } }
            } }
         end,
      ['<C-f>'] = function()
            cmp.confirm {
               behavior = cmp.ConfirmBehavior.Insert,
               select = true,
            }
         end,
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping
      ['<Tab>'] = function(fallback)
            if cmp.visible() then
               cmp.select_next_item()
            else
               fallback()
            end
         end
   },
   sources = {
      {
         name = 'nvim_lsp',
         priority = 10
      },
      {
         name = 'buffer',
         option = {
            keyword_length  = 2,
            keyword_pattern = [[[=A-Za-zäüöÄÜÖ=][=0-9A-Za-zäüöÄÜÖß=]*\%([-_][=0-9A-Za-zäüöÄÜÖß=]*\)*]],
            get_bufnrs = function()
               local bufs = {}
               for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
               end
               return vim.tbl_keys(bufs)
            end
         }
      },
      { name = 'path' },
      { name = 'nvim_lua' },
      {
         name = 'latex_symbols',
         keyword_length = 2
      },
      {
         name = 'ultisnips',
         keyword_length = 1,
         priority = 5
      }
   },
   snippet = {
      expand = function(args)
         vim.fn["UltiSnips#Anon"](args.body)
      end
   },
   sorting = {
      comparators = {
         cmp.config.compare.kind,
         cmp.config.compare.length
      }
   },
   formatting = {
      format = function(entry, vim_item)
         -- fancy icons and a name of kind
         -- set a name for each source

         if entry.source.name == 'nvim_lsp' then
            vim_item.kind = string.format(
               '[Lsp] %s %s',
               vim_item.kind,
               require'lspkind'.presets.default[vim_item.kind]
            )
         else
            vim_item.kind = ({
               buffer        = "[Buf]",
               luasnip       = "[LSnp]",
               ultisnips     = "[Snp]",
               nvim_lua      = "[Lua]",
               latex_symbols = "[Ltx]",
            })[entry.source.name]
         end

         if entry.source.name == 'ultisnips' then
            vim_item.menu = entry:get_completion_item().snippet.description
         end

         return vim_item
      end
   },
   experimental = {
      ghost_text = false
   }
}

--
-- `/` cmdline setup.
-- cmp.setup.cmdline('/', {
--    sources = {
--       { name = 'buffer' }
--    }
-- })
--
-- cmp.setup.cmdline('?', {
--    sources = {
--       { name = 'buffer' }
--    }
-- })

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
   })
})

for _,v in ipairs({'gitcommit', 'rnvimr'}) do
   vim.cmd(
      [[autocmd FileType ]] .. v ..
      [[ lua require('cmp').setup.buffer { enabled = false }]]
   )
end
--
-- ['<C-p>']     = cmp.mapping.select_prev_item(),
-- ['<C-n>']     = cmp.mapping.select_next_item(),
-- ['<C-h>']     = cmp.mapping.scroll_docs(-4),
-- ['<C-f>']     = cmp.mapping.scroll_docs(4),
-- ['<C-Space>'] = cmp.mapping.complete(),
-- ['<C-e>']     = cmp.mapping.close()
-- ['<CR>']      = cmp.mapping.confirm({
--     behavior = cmp.ConfirmBehavior.Insert,
--     select = true
--   })
-- },
