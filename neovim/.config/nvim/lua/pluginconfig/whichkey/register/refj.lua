local mappings = {
   ['<leader>'] = {
      f = {
         name = 'Format',
         j    = { [[:lua require('revj').format_line()<CR>]], [[RevJ]] }
      }
   }
}

for _, v in ipairs({'x', 'n'}) do
   require'which-key'.register(mappings,  { mode = v })
end
