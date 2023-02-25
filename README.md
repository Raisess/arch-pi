# ArchPI

This is a collection of scripts and tools to setup a Raspberry PI in a small server using Arch Linux ARM.

## Scripts

- **sdcard_setup**: Prepare the sdcard creating boot and root partitions and copying the image to it.
  - usage:

```shell
# ./scripts/sdcard_setup.sh <device> <image>

./scripts/sdcard_setup.sh sdx ~/Downloads/ArchLinuxARM-rpi-armv7-latest.tar.gz
```

You can download the Arch ARM for RPI directly [here](http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-armv7-latest.tar.gz).
All available images list [here](https://archlinuxarm.org/about/downloads).

- **server_setup**: Download and install server tools and prepare services to be added.

## Tools

These tools are added automatically by the `setup_server.sh` scriptHOW TO USE: :

- [maestro](https://github.com/Raisess/maestro): Manage background processes.
  - You can use to start your services in background and track logs without opening directly in your main TTY.
- [pingr](https://github.com/Raisess/pingr): HTTP/S Services status checker.
  - You can use to ensure running HTTP/S services in your machine or in the web.
- [dbc](https://github.com/Raisess/dbc): A database container manager.
  - You can use to start pre-configured databases in your machine using images from docker library using different container managers
   (Recommend you to use `podman` to not have to start a daemon).
