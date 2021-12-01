local function tt()
   return(toggleterminals.default)
end

require'which-key'.register({
   t = {
      name = 'ToggleTerm',
      t = { function() tt():toggle() end, "Toggle" },
      ['['] = { function() tt():close() end, "Close Terminal" },
      a = { function() tt():jump_to_term_append() end, "jump to terminal" },
      c = { function() tt().terminal:clear() end, 'Clear Term' },
      ['<'] = { function() tt():size_dec() end, "decrease size" },
      ['>'] = { function() tt():size_inc() end, "increase size" },
   }
},  {
   mode = "n", prefix = "<leader>"
})
