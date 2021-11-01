local mappings = {
    w = { [[<Plug>WordMotion_w]], "WordMotion w"},
    e = { [[<Plug>WordMotion_e]], "WordMotion e"},
    b = { [[<Plug>WordMotion_b]], "WordMotion b"},
    g = {
        name = 'g',
        e = { [[<Plug>WordMotion_ge]], "WordMotion ge"}
    }
}

for _,v in ipairs({'n', 'o', 'x'}) do
   require'which-key'.register(mappings , { mode = v, prefix = "'" })
end
