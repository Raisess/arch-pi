# ArchPI

This is a collection of scripts and tools to setup a Raspberry PI in a small server using Arch Linux ARM.

## Scripts

- **sdcard_setup**: Prepare the sdcard creating boot and root partitions and copying the image to it.
  - usage:

```shell
# ./scripts/sdcard_setup.sh <device> <image>.tar.gz

./scripts/sdcard_setup.sh sdx ~/Downloads/ArchLinuxARM-rpi-armv7-latest.tar.gz
```

You can download the Arch ARM for RPI directly [here](http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-armv7-latest.tar.gz).
All available images list [here](https://archlinuxarm.org/about/downloads).

- **server_setup**: Download and install server tools (also can be used to upgrade your current server tools version).
  - usage:

```shell
./scripts/setup_server.sh
```

## Tools

These tools are added automatically by the `setup_server.sh` script:

- [maestro](https://github.com/Raisess/maestro): Manage background processes.
  - You can use to start your services in background and track logs without opening directly in your main TTY.

- [box](https://github.com/Raisess/box): Manage your containers.

## Containers

A set of pre-configurated containers to home server usage.
These containers will use the `sda` device mounted on `/media/sda` to create an `.appdata` folder and mount volumes.
These containers can be creating using the [box](https://github.com/Raisess/box) cli.

- For `old_containers`: You can change that path in the scripts (`APPDATA_PATH`).

#### Filebrowser

- name: `filebrowser`
- official website: https://filebrowser.org
- status: `tested`
- webui port: `1234`

A cool file manager tool.

#### Jellyfin

- name: `jellyfin`
- official website: https://jellyfin.org
- status: `tested`
- webui port: `8096`

Local media streaming service.

#### Deluge

- name: `deluge`
- official website: https://deluge-torrent.org
- status: `tested`
- webui port: `8112`

BitTorrent client.
