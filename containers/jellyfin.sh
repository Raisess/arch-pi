#! /usr/bin/env sh

CONTAINER_NAME=jellyfin
APPDATA_PATH=/media/sda/.appdata
CONTAINER_APPDATA_PATH=$APPDATA_PATH/$CONTAINER_NAME

DATA_PATH=/media/sda/media/video

mkdir -p $CONTAINER_APPDATA_PATH/{cache,config}

podman create --name $CONTAINER_NAME \
	--user $(id -u):$(id -g) \
	-v $CONTAINER_APPDATA_PATH/cache:/cache \
	-v $CONTAINER_APPDATA_PATH/config:/config \
	-p 8096:8096/tcp \
	--mount type=bind,source=$DATA_PATH,destination=/media,ro=true,relabel=private \
	docker.io/jellyfin/jellyfin:latest

maestro create $CONTAINER_NAME "podman start $CONTAINER_NAME --attach"
