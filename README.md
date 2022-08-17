# YouCompleteMe-Ubuntu20.04
> A docker image for YouCompleteMe built on Ubuntu 20.04

This docker image for YouCompleteMe is built on Ubuntu 20.04.

You can edit the Dockerfile to change the OS.

The built directory will be at `/srv/YouCompleteMe` in the image.

## Create container
You should create a container to copy the built directory:
```sh
sudo docker run --name youcompleteme -it hlf01/youcompleteme-ubuntu20.04
```

## Copy the built directory from container
Use command to copy the directory to your plugin directory.

Please edit the variable `YOUR_PLUGIN_LOCATION`:
```sh
sudo docker cp youcompleteme:/srv/YouCompleteMe ~/.vim/YOUR_PLUGIN_LOCATION/YouCompleteMe
```

## Link
[dockerhub](https://hub.docker.com/repository/docker/hlf01/youcompleteme-ubuntu20.04)

