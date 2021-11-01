for _,v in ipairs({'n', 'o', 'x'}) do
   require'which-key'.register( {
      name = 'Hop',
      w = { require'hop'.hint_words, [[Word]] },
      j = { function()
            require'hop'.hint_lines_skip_whitespace()
            vim.cmd("normal zz")
         end, [[Line]]
      },
      f = { require'hop'.hint_char1, [[Char]] }
   }, { mode = v, prefix = 'f' } )
end
