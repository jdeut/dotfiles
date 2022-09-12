local mp = require'mp'
local utils = require'mp.utils'

local t = {}

t.open = function()
   utils.subprocess({args={
      "xdg-open",
      "https://ffmpeg.org/ffmpeg-filters.html#Video-Filters"
   }})
end

t.download = function()
   local uri = mp.get_property("path")

   local pipe = io.popen("yt-dlp --get-filename " .. uri)
   local path = pipe:read("*a")
   pipe:close()
   path = path:gsub("^%s*(.-)%s*$", "%1")

   mp.command_native_async(
      { name = 'subprocess', args = { 'yt-dlp', uri } },
      function(success, result, error)
         if success then
            mp.command_native({
               name = 'subprocess',
               args = {
                  'gpaste-client',
                  'file',
                  path
               }
            })
         end
      end
   )

end

mp.add_key_binding('F9', t.open)
mp.add_key_binding('F3', t.download)
