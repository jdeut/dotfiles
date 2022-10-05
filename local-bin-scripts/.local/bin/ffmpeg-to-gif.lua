-- /* #!/bin/zsh
--
-- set -x
--
-- if [ $# -eq 0 ]
-- then
--     echo "Please pass a filename to the program"
--     exit 1
-- fi
--
-- ffmpeg_gif () {
--     # ext="${1##*.}"
--     # TFILE="${1%.*}_.$ext"
--     OUT="$2"
--     rate="$3"
--     filters="setpts=${rate}*PTS"
--     TNEW=$(mktemp --suffix=".mp4")
--     PALETTE=$(mktemp --suffix=".png")
--     TGIFFILE="${1%.*}_.gif"
--
--     ffmpeg -y -i "$1" -vf "palettegen=stats_mode=diff" "$PALETTE"
--     ffmpeg -y -i "$1" -i "$PALETTE" -filter_complex "[0:v]${filters}[filtered],[filtered][1:v] paletteuse" "$TGIFFILE"
--
--     gifsicle -i --color-method=median-cut --colors 226 --lossy=35 -O3 "$TGIFFILE" > "$OUT"
--
--     rm "$TGIFFILE"
-- }
--
--
-- # mpv --stream-record="$TFILE" "$@"
--
-- RATE=$(gxmessage -entrytext 1 Speed)
--
-- ffmpeg_gif "$@" "${@%.*}_oneway.gif" "$RATE"
--
-- ################
--
-- bounce="${@%.*}_new.mp4"
--
-- ffmpeg -i "$@" -filter_complex "[0:v]reverse,fifo[r];[0:v][r] concat=n=2:v=1 [v]" -map "[v]" "$bounce"
--
-- ffmpeg_gif "$bounce" "${@%.*}_bounce.gif" "$RATE"
--
-- rm "$bounce"
--
--
-- nohup eog "$TGIFFILE_BOUNCE"
--
-- #RET=$(wl-copy < "$TGIFFILE") */
--

local sh         = require'shell'
local dump       = require'pl.pretty'.debug
local Path, path = require'pl.path'

arg[1] = '/home/johannes/Videos/yt-dlp/rassismusindownundergewaltgegenaborigines10016m47s120ms16m50s310ms_(00m00s080ms-00m01s940ms).mp4'

if arg[1] then
   path = Path.exists(arg[1]) or assert(nil, 'path must exist')
else
   assert(nil, 'no argument provided')
end

local FFtogif = {}

function FFtogif:new(o)
   o = o or {}

   self.__index = self

   setmetatable(o, self)

   assert(o.path)

   self.srcpath = o.path
   self.pts = 1 / o.speed or 1 / o.speed and 1
   self.dirname = Path.dirname(arg[1])
   self.palette = 'palette.png'

   self.filter = {}

   self.filter.setps = function(in1, out)
      return '['.. in1 ..']'.. 'setpts=' .. self.pts ..'*PTS' .. '[' .. out .. ']'
   end

   return o
end

function FFtogif:palettegen()
   local f = table.concat({
      self.filter.setps('0:v', 'filtered'),
      '[filtered]palettegen=stats_mode=diff'
   }, ',')

   dump(f)

   -- local pipe = sh.pipe('cat')

   local cmd = sh.cmd(
      'ffmpeg', '-y',
      '-i', self.srcpath,
      '-filter_complex', f,
      self.palette
   )

   dump(cmd:output())

   -- assert(nil)

   return self
end

function FFtogif:paletteuse()
   local f = table.concat({
      self.filter.setps('0:v', 'filtered'),
      '[filtered][1:v] paletteuse'
   }, ',')

   return sh.cmd(
      'ffmpeg', '-y',
      '-i', self.srcpath,
      '-i', self.palette,
      '-filter_complex', f,
      '-f', 'gif',
      'pipe:1'
   )
end

function FFtogif:gifsicle()
   return sh.cmd(
      'gifsicle', '-i',
      '--color-method=median-cut', '--colors', '200', '--lossy=35', '-O3'
   )
end

function FFtogif:open()
   local ret = sh.cmd('eog', 'giffile.gif'):exec()
   return self
end

local conv = FFtogif:new({ path = arg[1], speed = 1.3})

dump(conv:palettegen():paletteuse())
dump(conv:gifsicle()) -- gifsicle()
