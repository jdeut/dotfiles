require'which-key'.register({
   g = {
      k = { [[<Plug>(matchup-g%)]], 'matchup g%' }
   },
   z = {
      k = { [[<Plug>(matchup-z%)]], 'matchup z%' }
   }
}, { mode = 'n' })

local mappings = {
   a = {
      ['k'] = { [[<Plug>(matchup-a%)]], 'Matchup a%' }
   },
   i = {
      ['k'] = { [[<Plug>(matchup-i%)]], 'Matchup a%' }
   }
}

for _,v in ipairs({'o', 'x'}) do
   require'which-key'.register(mappings, { mode = v, prefix = '', noremap = true })
end
