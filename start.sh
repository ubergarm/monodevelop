#!/usr/bin/env bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist "$DISPLAY" | sed -e 's/^..../ffff/' | xauth -f "$XAUTH" nmerge -

docker run --rm \
           -d \
           -v "$XAUTH":"$XAUTH" \
           -v "$XSOCK":"$XSOCK" \
           -v "$PWD":/home/user/workdir \
           -e"XAUTHORITY"="$XAUTH" \
           -e"DISPLAY" \
           ubergarm/monodevelop
