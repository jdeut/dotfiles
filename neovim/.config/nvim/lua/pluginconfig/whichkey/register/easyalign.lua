local mappings = {
   ['<leader>'] = {
      f = {
         name  = 'Format',
         a = { [[<Plug>(EasyAlign)]], 'EasyAlign', silent = false },
         l = { [[<Plug>(LiveEasyAlign)]], 'EasyAlign', silent = false },
         ['='] = { [[:EasyAlign1=<CR>]], 'EasyAlign = '}
      }
   }
}

for _, v in ipairs({'x', 'n'}) do
   require'which-key'.register(mappings,  { mode = v })
end
