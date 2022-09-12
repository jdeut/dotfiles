local mappings = {
   ['<leader>'] = {
      f = {
         name  = 'Format',
         t = { function()
               if type(MiniTrailspace) == 'table' then
                  MiniTrailspace.trim()
               end
            end,
            'Trim Trailing Space', silent = false
         },
      }
   }
}

for _, v in ipairs({'n'}) do
   require'which-key'.register(mappings,  { mode = v })
end
