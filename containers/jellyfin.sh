#! /usr/bin/env sh

APPDATA_PATH=/media/sda/.appdata
DATA_PATH=/media/sda/media/video

mkdir -p $APPDATA_PATH/jellyfin
mkdir $APPDATA_PATH/jellyfin/cache
mkdir $APPDATA_PATH/jellyfin/config

podman create --name jellyfin \
	--user $(id -u):$(id -g) \
	-v $APPDATA_PATH/jellyfin/cache:/cache \
	-v $APPDATA_PATH/jellyfin/config:/config \
	-p 8096:8096/tcp \
	--mount type=bind,source=$DATA_PATH,destination=/media,ro=true,relabel=private \
	docker.io/jellyfin/jellyfin:latest
