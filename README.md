ubergarm/monodevelop
===
Run monodevelop IDE inside a docker image to keep your host machine free of GTK cruft!

## Build
```bash
docker build -t ubergarm/monodevelop .
```

## Run
```bash
./start.sh
```

## Use
Mount your files to edit locally into the container at `/home/user/workdir`

## References
* [monodevelop install](https://www.monodevelop.com/download/)
