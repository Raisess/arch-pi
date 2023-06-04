#! /usr/bin/env sh

CONTAINER_NAME=deluge
APPDATA_PATH=/media/sda/.appdata
CONTAINER_APPDATA_PATH=$APPDATA_PATH/$CONTAINER_NAME

DOWNLOADS_PATH=/media/sda/downloads

mkdir -p $CONTAINER_APPDATA_PATH/config

podman create --name $CONTAINER_NAME \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -e TZ=Etc/UTC \
  -e DELUGE_LOGLEVEL=error \
  -p 8112:8112/tcp \
  -p 6881:6881/tcp \
  -p 6881:6881/udp \
  -v $CONTAINER_APPDATA_PATH/config:/config \
  -v $DOWNLOADS_PATH:/downloads \
  lscr.io/linuxserver/deluge:latest

maestro create $CONTAINER_NAME "podman start $CONTAINER_NAME --attach"
