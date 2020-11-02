#!/usr/bin/env bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod 664 $XAUTH

docker run --rm \
           -it \
           -v "$XAUTH":"$XAUTH" \
           -v "$XSOCK":"$XSOCK" \
           -v "$PWD":/home/user/workdir \
           -e"XAUTHORITY"="$XAUTH" \
           -e"DISPLAY" \
           ubergarm/monodevelop
