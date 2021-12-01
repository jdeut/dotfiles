wk = require('which-key')

local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

mappings = {
   [';'] = { [[ö]], [[ö]] },
   ['['] = { [[ü]], [[ü]] },
   ["'"] = { [[ä]], [[ä]] },
   [':'] = { [[Ö]], [[Ö]] },
   ['{'] = { [[Ü]], [[Ü]] },
   ['"'] = { [[Ä]], [[Ä]] },
   ['-'] = { [[ß]], [[ß]] },
   ['`'] = { [[`]], [[`]] },
   ['<Tab>']= {
      [[<C-R>=expand('%:p:h')<CR>]], [[expand path]]
   }
}

for _, v in ipairs({'i', 'c'}) do
   opts = v == 'i' and 
      { mode = v, prefix = [[`]] } or 
      { mode = v, prefix = [[`]], silent = false}

   wk.register(mappings, opts)
end
