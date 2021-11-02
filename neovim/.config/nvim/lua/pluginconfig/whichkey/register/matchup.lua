require'which-key'.register({
   ['<Tab>'] = { [[<Plug>(matchup-%)]], 'matchup %' },
   g = {
      ['<Tab>'] = { [[<Plug>(matchup-g%)]], 'matchup g%' }
   },
   ['<leader>'] = {
      ['<Tab>'] = { [[<Plug>(matchup-z%)]], 'matchup z%' }
   }
}, { mode = 'n' })

for _,v in ipairs({'o', 'x'}) do
   require'which-key'.register( {
      a = {
         ['<Tab>'] = { [[<Plug>(matchup-a%)]], 'Matchup a%' }
      },
      i = {
         ['<Tab>'] = { [[<Plug>(matchup-i%)]], 'Matchup a%' }
      }
   }, { mode = v, prefix = '', noremap = true })
end
