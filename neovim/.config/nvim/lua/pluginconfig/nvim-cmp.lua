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

local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
local cmp_keymap = require("cmp.utils.keymap")

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
      ['<C-d>'] = function(fallback)
          if cmp.visible() then cmp.scroll_docs(4)
          else fallback()
          end
      end,
      ['<C-u>'] = function(fallback)
          if cmp.visible() then cmp.scroll_docs(-4)
          else fallback()
          end
      end,
      ['<C-e>'] = cmp.mapping({ i = cmp.abort, c = cmp.close }),
      ['<C-f>'] = cmp.mapping({
         i = function(fallback) cmp_ultisnips_mappings.expand_or_jump_forwards(fallback) end,
         s = function(fallback) cmp_ultisnips_mappings.expand_or_jump_forwards(fallback) end,
         x = function() vim.api.nvim_feedkeys(cmp_keymap.t("<Plug>(ultisnips_expand)"), 'm', true) end
      }),
      ['<C-h>'] = cmp.mapping(
         function(fallback) cmp_ultisnips_mappings.jump_backwards(fallback) end,
         { "i", "s" }
      )
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
      -- format = require'lspkind'.cmp_format({
      --    mode = 'symbol_text', -- show only symbol annotations
      --    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      --
      --    -- The function below will be called before any actual modifications from lspkind
      --    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      --    before = function (entry, vim_item)
      --       return vim_item
      --    end
      -- })
   },
   experimental = {
      ghost_text = false
   }
}


-- `:` cmdline setup.
cmp.setup.cmdline(':', {
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
   })
})

for _, v in ipairs({ 'gitcommit', 'rnvimr' }) do
   vim.api.nvim_create_autocmd('FileType', {
      pattern = v,
      callback = function() require'cmp'.setup.buffer { enabled = false } end
   })
end

require 'cmp_nvim_ultisnips'.setup {
   show_snippets = "all",
   documentation = function(snippet)
      return snippet.value
   end
}
