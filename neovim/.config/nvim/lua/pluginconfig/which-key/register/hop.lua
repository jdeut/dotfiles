-- local t = {
--    maps = {
--       { 'f', require'hop'.hint_char1, [[Char]] },
--       { 'j', require'hop'.hint_lines_skip_whitespace, [[Char]] },
--       { 'w', require'hop'.hint_words, [[Char]] }
--    },
--    prefixes = {
--       F = { opts = { multi_windows = true }, append = 'MW'},
--       f = { opts = {}, append = '' }
--    }
-- }

for _, v in ipairs {'n', 'o', 'x'} do
   require'which-key'.register( {
         a = { require'hop'.hint_anywhere, [[Char]] },
         f = { require'hop'.hint_char1, [[Char]] },
         j = { require'hop'.hint_lines_skip_whitespace, [[Lines]] },
         w = { require'hop'.hint_words, [[Words]] },
         v = { require'hop'.hint_vertical, [[Vertical]] }
      }, { mode = v, prefix = 'f' }
   )
end

require'which-key'.register( {
      F = { function() require'hop'.hint_char1 { multi_windows = true } end, [[Char MW]] },
      J = { function() require'hop'.hint_lines_skip_whitespace { multi_windows = true } end, [[Lines MW]] },
      W = { function() require'hop'.hint_words { multi_windows = true } end, [[Words MW]] }
   }, { mode = 'n', prefix = 'f' }
)
