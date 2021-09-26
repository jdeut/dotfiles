#!/bin/bash

_dirs()  { 
cat <<EOF 
MUSIC
DOWNLOAD
VIDEOS
DOCUMENTS
PICTURES
EOF
}

case "$1" in 
start)
    _dirs | xargs -L1 xdg-user-dir | xargs -I {} ln -s {} "$HOME"
   ;;
stop)
   _dirs | xargs -L1 xdg-user-dir | xargs -L1 basename | xargs -I {} unlink "$HOME/{}"
   ;;
restart)
   $0 stop
   $0 start
   ;;
*)
   echo "Usage: $0 {start|stop}"
esac

exit 0 
