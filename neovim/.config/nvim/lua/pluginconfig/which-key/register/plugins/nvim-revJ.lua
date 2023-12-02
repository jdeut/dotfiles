local ok, revj = pcall(require, 'revj')

if not ok then return end

local maps = {
   n = {
      j    = { revj.format_line, [[RevJ]] }
   },
   x = {
      j    = { revj.format_visual, [[RevJ]] }
   }
}

for k,v in pairs(maps) do
   require'which-key'.register(v,  { prefix = [[<leader>f]], mode = k })
end
