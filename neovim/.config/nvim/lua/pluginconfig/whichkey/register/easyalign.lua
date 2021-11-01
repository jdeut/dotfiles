local mappings = {
   ['<leader>'] = {
      f = {
         name  = 'Format',
         a = { [[<Cmd>EasyAlign<CR>]], 'EasyAlign' },
         ['='] = { [[:EasyAlign1=<CR>]], 'EasyAlign = ' }
      }
   }
}

for _, v in ipairs({'x', 'n'}) do
   require'which-key'.register(mappings,  { mode = v })
end
