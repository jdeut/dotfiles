#!/bin/zsh

set -x

if [ $# -eq 0 ]
then
    echo "Please pass a filename to the program"
    exit 1
fi

ffmpeg_gif () {
    # ext="${1##*.}"
    # TFILE="${1%.*}_.$ext"
    OUT="$2"
    rate="$3"
    filters="setpts=${rate}*PTS"
    TNEW=$(mktemp --suffix=".mp4")
    PALETTE=$(mktemp --suffix=".png")
    TGIFFILE="${1%.*}_.gif"

    ffmpeg -y -i "$1" -vf "palettegen=stats_mode=diff" "$PALETTE"
    ffmpeg -y -i "$1" -i "$PALETTE" -filter_complex "[0:v]${filters}[filtered],[filtered][1:v] paletteuse" "$TGIFFILE"

    gifsicle -i --color-method=median-cut --colors 226 --lossy=35 -O3 "$TGIFFILE" > "$OUT"

    rm "$TGIFFILE"
}


# mpv --stream-record="$TFILE" "$@"

RATE=$(gxmessage -entrytext 1 Speed)

ffmpeg_gif "$@" "${@%.*}_oneway.gif" "$RATE"

################

bounce="${@%.*}_new.mp4"

ffmpeg -i "$@" -filter_complex "[0:v]reverse,fifo[r];[0:v][r] concat=n=2:v=1 [v]" -map "[v]" "$bounce"

ffmpeg_gif "$bounce" "${@%.*}_bounce.gif" "$RATE"

rm "$bounce"


nohup eog "$TGIFFILE_BOUNCE"

#RET=$(wl-copy < "$TGIFFILE")
