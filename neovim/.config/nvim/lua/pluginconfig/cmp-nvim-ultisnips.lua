local cmp = require'cmp'
local cmp_config = cmp.get_config()
local cmp_ultisnips_mappings = require'cmp_nvim_ultisnips.mappings'
local cmp_keymap = require'cmp.utils.keymap'

require 'cmp_nvim_ultisnips'.setup {
   show_snippets = "all",
   documentation = function(snippet)
      return snippet.value
   end
}

local t = function(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp_config.mapping = vim.tbl_deep_extend('force', cmp_config.mapping, {
   ["<Tab>"] = cmp.mapping({
      c = function()
         if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
         else
            cmp.complete()
         end
      end,
      i = function(fallback)
         if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
         elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
         else
            fallback()
         end
      end,
      s = function(fallback)
         if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
         else
            fallback()
         end
      end
   }),
   ['<C-f>'] = cmp.mapping{
      i = function(fallback) cmp_ultisnips_mappings.expand_or_jump_forwards(fallback) end,
      s = function(fallback) cmp_ultisnips_mappings.expand_or_jump_forwards(fallback) end,
      x = function() vim.api.nvim_feedkeys(cmp_keymap.t("<Plug>(ultisnips_expand)"), 'm', true) end
   },
   ['<C-h>'] = cmp.mapping(
      function(fallback) cmp_ultisnips_mappings.jump_backwards(fallback) end,
      { "i", "s" }
   )
})

cmp_config.snippet = {
   expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
   end
}

table.insert(cmp_config.sources, {
      name = 'ultisnips',
      keyword_length = 1,
      priority = 5
   }
)

cmp.setup(cmp_config)
