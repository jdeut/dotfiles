local function tt()
   return(toggleterminals.default)
end

require'which-key'.register({
   t = {
      name = 'ToggleTerm',
      ['<C-o>'] = { function() tt():jump_to_term_append() end, "jump to terminal" },
      ['['] = { function() tt():close() end, "Close Terminal" },
      ['<'] = { function() tt():size_dec() end, "decrease size" },
      ['>'] = { function() tt():size_inc() end, "increase size" },
      ['s'] = { function() tt():restart() end, "increase size" },
      t = { function() tt():toggle() end, "Toggle" },
      c = { function() tt().terminal:clear() end, 'Clear Term' }
   }
},  {
   mode = "n", prefix = "<leader>"
})
