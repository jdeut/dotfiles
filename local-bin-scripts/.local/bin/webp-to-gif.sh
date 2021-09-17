#!/bin/zsh

if [ $# -eq 0 ]
then
    echo "Please pass a filename to the program"
    exit 1
fi

TFILE=$(mktemp --suffix=".mp4")
TNEW=$(mktemp --suffix=".mp4")
TGIFFILE=$(mktemp --suffix=".gif")
PALETTE=$(mktemp --suffix=".png")

mpv --stream-record="$TFILE" "$@"

RATE=$(gxmessage -entrytext 1 Speed)


GENNEW="ffmpeg -y -i \"$TFILE\" -filter:v \"setpts=$RATE*PTS,fps=fps=17\" -movflags faststart \"$TNEW\""
GENPALETTE="ffmpeg -y -i \"$TNEW\" -vf \"palettegen=stats_mode=diff\" \"$PALETTE\""
GENGIF="ffmpeg -y -i \"$TNEW\" -i \"$PALETTE\" -filter_complex \"[0:v][1:v] paletteuse\" \"$TGIFFILE\""

urxvt -e bash -c "$GENNEW ; $GENPALETTE ; $GENGIF ; gifsicle -O3 $TGIFFILE -o $TGIFFILE"

nohup eog $TGIFFILE

#RET=$(wl-copy < "$TGIFFILE")
