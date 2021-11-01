require'which-key'.register({
   g = {
      k = { [[<Plug>(matchup-g%)]], 'matchup g%' }
   },
   z = {
      k = { [[<Plug>(matchup-z%)]], 'matchup z%' }
   }
}, { mode = 'n' })

for _,v in ipairs({'o', 'x'}) do
   require'which-key'.register( {
         a = {
            ['k'] = { [[<Plug>(matchup-a%)]], 'Matchup a%' }
         },
         i = {
            ['k'] = { [[<Plug>(matchup-i%)]], 'Matchup a%' }
         }
      }, { mode = v, prefix = '', noremap = true }
   )
end
