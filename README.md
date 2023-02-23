# ArchPI

This is a collection of scripts and tools to setup a Raspberry PI in a small server using Arch Linux ARM.

## Scripts

**sdcard_setup**: Prepare the sdcard creating boot and root partitions and copying the image to it.

- USAGE:

```shell
# ./scripts/sdcard_setup.sh <device> <image>

./scripts/sdcard_setup.sh sdx ~/Downloads/ArchLinuxARM-rpi-armv7-latest.tar.gz
```

You can download the Arch ARM for RPI directly [here](http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-armv7-latest.tar.gz).
All available images list [here](https://archlinuxarm.org/about/downloads).

**server_setup**: Download and install server tools and prepare services to be added.

## Tools

These tools are added automatically by the `setup_server.sh` script:

- [dbc](https://github.com/Raisess/dbc): A database container manager.
- [pingr](https://github.com/Raisess/pingr): HTTP Services status checker.
