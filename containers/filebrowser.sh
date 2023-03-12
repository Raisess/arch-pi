#! /usr/bin/env sh

APPDATA_PATH=/media/sda/.appdata
DATA_PATH=/media/sda

mkdir -p $APPDATA_PATH/filebrowser
touch $APPDATA_PATH/filebrowser/settings.json
touch $APPDATA_PATH/filebrowser/filebrowser.db

podman create --name filebrowser \
	-v $APPDATA_PATH/filebrowser/settings.json:/config/settings.json \
	-v $APPDATA_PATH/filebrowser/filebrowser.db:/database/filebrowser.db \
	-v $DATA_PATH:/srv \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-p 1234:80 \
	docker.io/filebrowser/filebrowser:latest

maestro create filebrowser "podman start filebrowser --attach"
