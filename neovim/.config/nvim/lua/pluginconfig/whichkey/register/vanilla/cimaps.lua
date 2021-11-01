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
    ['`'] = { [[`]], [[`]] }
}

for _, v in ipairs({'i', 'c'}) do
   wk.register(mappings,  {
      mode = 'i', prefix = [[`]]
   })
end
