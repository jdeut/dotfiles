local mp = require'mp'
local utils = require'mp.utils'

local t = {}

t.open = function()
   utils.subprocess({args={"xdg-open", "https://ffmpeg.org/ffmpeg-filters.html#Video-Filters"}})
end

mp.add_key_binding('F9', 'ffmpeg-filters-help', t.open)
