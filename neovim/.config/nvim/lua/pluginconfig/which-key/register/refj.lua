local maps = {
   n = {
      name = 'revJ',
      j    = { require('revj').format_line, [[RevJ]] }
   },
   x = {
      name = 'revJ',
      j    = { require('revj').format_visual, [[RevJ]] }
   }
}

for k,v in pairs(maps) do
   require'which-key'.register(v,  { prefix = [[<leader>f]], mode = k })
end
