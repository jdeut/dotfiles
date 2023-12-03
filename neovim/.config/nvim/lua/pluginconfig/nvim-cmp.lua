--require('plenary.job'):new({command = gxmessage', args = { vim.fn.expand('<afile>:p')}}):sync()
--
--
--
local cmp = require 'cmp'

local types = require 'cmp.types'

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- cmp.setup {
--    mapping = {}
-- }

cmp.setup {
   preselect = types.cmp.PreselectMode.Item,
   completion = {
      keyword_pattern = [[[=A-Za-zäüöÄÜÖ=][=0-9A-Za-zäüöÄÜÖß=]*\%([-_][=0-9A-Za-zäüöÄÜÖß=]*\)*]],
      keyword_length = 1
   },
   window = {
      documentation = {
         border = 'double',
         winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat'
      }
   },
   mapping = {
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping
      ['<Tab>'] = function(fallback)
          if cmp.visible() then cmp.select_next_item()
          else fallback()
          end
      end,
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
      ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
      ['<C-e>'] = cmp.mapping({ i = cmp.abort, c = cmp.close })
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
            get_bufnrs      = function()
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
   },
   sorting = {
      comparators = {
         cmp.config.compare.kind,
         cmp.config.compare.length
      }
   },
   experimental = {
      ghost_text = false
   }
}


-- `:` cmdline setup.

for _, v in ipairs({ 'gitcommit', 'rnvimr' }) do
   vim.api.nvim_create_autocmd('FileType', {
      pattern = v,
      callback = function() require'cmp'.setup.buffer { enabled = false } end
   })
end
