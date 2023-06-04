#! /usr/bin/env sh

CONTAINER_NAME=hello-world
APPDATA_PATH=/media/sda/.appdata
CONTAINER_APPDATA_PATH=$APPDATA_PATH/$CONTAINER_NAME

mkdir -p $CONTAINER_APPDATA_PATH

podman create --name $CONTAINER_NAME \
  -v $CONTAINER_APPDATA_PATH:/ \
  docker.io/hello-world/hello-world:latest

maestro create $CONTAINER_NAME "podman start $CONTAINER_NAME --attach"
