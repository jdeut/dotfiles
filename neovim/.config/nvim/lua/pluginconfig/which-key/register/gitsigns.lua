require'which-key'.register({
   i = {
      name = 'Git',
      h    = {
         name = 'GitSigns (Hunks)',
         l    = { require'gitsigns'.toggle_linehl, [[Toggle linehl]] },
         m    = { require'gitsigns'.toggle_numhl, [[Toggle numhl]] },
         w    = { require'gitsigns'.toggle_word_diff, [[Toggle Word Diff]] },
         s    = { require'gitsigns'.stage_hunk, [[Stage Hunk]] },
         u    = { require'gitsigns'.undo_stage_hunk, [[Undo Stage Hunk]] },
         r    = { require'gitsigns'.reset_hunk, [[Reset Hunk]] },
         v    = { require'gitsigns'.preview_hunk, [[Preview Hunk]] },
         b    = { require'gitsigns'.blame_line, [[Blame Line]] },
         n    = { require'gitsigns'.next_hunk, [[Jump to Next Hunk]] },
         p    = { require'gitsigns'.prev_hunk, [[Jump to Prev Hunk]] },
         q    = { require'gitsigns'.setqflist, [[Quickfix Show Hunks]] },
      }
   }
},  { mode = 'n', prefix = '<leader>' })

local mappings = {
   i = {
      name = 'inner',
      h = { [[<Cmd>Gitsigns select_hunk<cr>]], 'Hunk'},
   }
}

for _,v in ipairs({'o', 'x'}) do
   require'which-key'.register(
      mappings,
      { mode = v, prefix = '', noremap = true }
   )
end
