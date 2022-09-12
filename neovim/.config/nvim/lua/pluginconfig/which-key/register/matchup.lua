require'which-key'.register({
   g = {
      ['<Tab>'] = { [[<Plug>(matchup-g%)]], 'matchup g%' }
   },
   d = {
      s = {
         ['<Tab>'] = { [[<Plug>(matchup-ds%)]], 'delete surrounding match' }
      }
   },
   c = {
      s = {
         ['<Tab>'] = { [[<Plug>(matchup-cs%)]], 'change surrounding match' }
      }
   }
}, { mode = 'n' })

for _,v in ipairs({'n', 'x'}) do
   require'which-key'.register({
      ['<Tab>'] = { [[<Plug>(matchup-%)]], 'matchup %' },
      ['<M-h>'] = { [[<Plug>(matchup-[%)]], 'prev match [%' },
      ['<M-j>'] = { [[<Plug>(matchup-z%)]], 'Goto Nearest Block (Match)' },
      ['<M-l>'] = { [[<Plug>(matchup-]%)]], 'next match ]%' }
   }, { mode = v })
end

for _,v in ipairs({'o', 'x'}) do
   require'which-key'.register( {
      ['<Tab>'] = { [[<Plug>(matchup-%)]], 'matchup %' },
      a = {
         ['<Tab>'] = { [[<Plug>(matchup-a%)]], 'Matchup a%' }
      },
      i = {
         ['<Tab>'] = { [[<Plug>(matchup-i%)]], 'Matchup a%' }
      }
   }, { mode = v, prefix = '', noremap = true })
end
