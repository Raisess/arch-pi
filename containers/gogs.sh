#! /usr/bin/env sh

CONTAINER_NAME=gogs
APPDATA_PATH=/media/sda/.appdata
CONTAINER_APPDATA_PATH=$APPDATA_PATH/$CONTAINER_NAME

mkdir -p $CONTAINER_APPDATA_PATH/data

podman create --name $CONTAINER_NAME \
  -v $CONTAINER_APPDATA_PATH/data:/data \
  -p 10880:3000/tcp \
  -p 10022:22/tcp \
  docker.io/gogs/gogs:latest

maestro create $CONTAINER_NAME "podman start $CONTAINER_NAME --attach"
