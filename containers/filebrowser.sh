#! /usr/bin/env sh

CONTAINER_NAME=filebrowser
APPDATA_PATH=/media/sda/.appdata
CONTAINER_APPDATA_PATH=$APPDATA_PATH/$CONTAINER_NAME

DATA_PATH=/media/sda

mkdir -p $CONTAINER_APPDATA_PATH
touch $CONTAINER_APPDATA_PATH/settings.json
touch $CONTAINER_APPDATA_PATH/filebrowser.db

podman create --name $CONTAINER_NAME \
	-v $CONTAINER_APPDATA_PATH/settings.json:/config/settings.json \
	-v $CONTAINER_APPDATA_PATH/filebrowser.db:/database/filebrowser.db \
	-v $DATA_PATH:/srv \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-p 1234:80 \
	docker.io/filebrowser/filebrowser:latest

maestro create $CONTAINER_NAME "podman start $CONTAINER_NAME --attach"
