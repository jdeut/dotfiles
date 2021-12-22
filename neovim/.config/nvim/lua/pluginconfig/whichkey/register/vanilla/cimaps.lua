local wk = require('which-key')
local helper = require'myhelper'

local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local mappings = {
   ['`'] = {
      name = '',
      [';'] = { [[ö]], [[ö]] },
      ['['] = { [[ü]], [[ü]] },
      ["'"] = { [[ä]], [[ä]] },
      [':'] = { [[Ö]], [[Ö]] },
      ['{'] = { [[Ü]], [[Ü]] },
      ['"'] = { [[Ä]], [[Ä]] },
      ['-'] = { [[ß]], [[ß]] },
      ['`'] = { [[`]], [[`]] },
      ['<Tab>'] = {
         [[<C-R>=expand('%:p')<CR>]], [[expand current path]]
      },
      ['.'] = {
         [[<C-R>=expand('%:.:h:s?$?/?')<CR>]], [[insert path relative to ...]]
      }
   },
   ['<C-h>'] = {
      function()
         helper.feedkeys_after_termcodes('<S-Left>')
      end, 'one word left'
   },
   ['<C-l>'] = {
      function()
         helper.feedkeys_after_termcodes('<S-Right>')
      end, 'one word right'
   },
}

for _, v in ipairs({'i', 'c'}) do
   local opts = v == 'i' and
      { mode = v, } or
      { mode = v, silent = false}

   wk.register(mappings, opts)
end
