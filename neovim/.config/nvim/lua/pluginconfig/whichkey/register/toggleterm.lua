local function tt()
   return(toggleterminals.default)
end

local function apply_to_terminals(fn)
   local wins = vim.api.nvim_list_wins()

   for _,win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')

      if buftype == 'terminal' then
         fn(buf, win)
      end
   end
end

require'which-key'.register({
   t = {
      name = 'ToggleTerm',
      -- ['<C-o>'] = { function() tt():jump_to_term_append() end, "jump to terminal" },
      ['['] = { function()
            apply_to_terminals(function(_, win) vim.api.nvim_win_hide(win) end)
         end, "Close Terminal"
      },
      ['<'] = { function()
            apply_to_terminals(function(_,win)
                  local width = vim.api.nvim_win_get_width(win)
                  vim.api.nvim_win_set_width(win, width - 25)
               end
            )
         end, "decrease size"
      },
      ['>'] = { function()
            apply_to_terminals(function(_,win)
                  local width = vim.api.nvim_win_get_width(win)
                  vim.api.nvim_win_set_width(win, width + 25)
               end
            )
         end, "increase size"
      }
      -- ['s'] = { function() tt():restart() end, "increase size" },
      -- t = { function() tt():toggle() end, "Toggle" },
      -- c = { function() tt().terminal:clear() end, 'Clear Term' }
   }
},  {
   mode = "n", prefix = "<leader>"
})
