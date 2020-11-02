ubergarm/monodevelop
===
Run monodevelop IDE inside a docker image to keep your host machine free of GTK cruft!

## Build
```bash
docker build -t ubergarm/monodevelop .
```

## Run
```bash
## Normal Use
./start.sh

## Debugging
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
           /bin/bash
```

## Use
Mount your files to edit locally into the container at `/home/user/workdir`

## Logs
`monodevelop` spits its logs out here and not to STDOUT/STDERR:
```bash
# inside the container context
cat /home/user/.cache/MonoDevelop/7.0/Logs/Ide.log
```

## References
* [monodevelop install](https://www.monodevelop.com/download/)
