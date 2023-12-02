for _,v in ipairs({'o', 'x'}) do
   require'which-key'.register( {
      a = {
         i = { [[<Plug>(textobj-indent-a)]], 'TextObj Indent Same' },
         I = { [[<Plug>(textobj-indent-same-a)]], 'TextObj Indent Same' },
         c = { [[<Plug>(textobj-comment-a)]], 'TextObj Comment' },
         C = { [[<Plug>(textobj-comment-big-a)]], 'TextObj Comment Big' },
         [','] = { [[<Plug>(textobj-parameter-a)]], 'TextObj Argument' },
         ['<C-,>'] = { [[<Plug>(textobj-parameter-greedy-a)]], 'TextObj Argument' }
      },
      i = {
         i = { [[<Plug>(textobj-indent-i)]], 'TextObj Indent' },
         I = { [[<Plug>(textobj-indent-same-i)]], 'TextObj Indent' },
         c = { [[<Plug>(textobj-comment-i)]], 'TextObj Comment' },
         C = { [[<Plug>(textobj-comment-big-i)]], 'TextObj Comment Big' },
         [','] = { [[<Plug>(textobj-parameter-i)]], 'TextObj Argument' },
         ['<C-,>'] = { [[<Plug>(textobj-parameter-greedy-a)]], 'TextObj Argument' }
      }
   }, { mode = v })
end
