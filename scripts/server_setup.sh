#! /usr/bin/env bash

# @DESCRIPTION: This script setup an raspberry pi using Arch Linux ARM to be used
# as a home server.
# @NOTE: To be executed in the raspberry pi (su mode).

DOWNLOAD_PATH=/tmp/arch-pi-server-setup
TOOLS_PATH=$DOWNLOAD_PATH/tools
SERVICES_PATH=$DOWNLOAD_PATH/services

echo "ArchPI Server Setup | TOOLS_PATH: $TOOLS_PATH / SERVICES_PATH: $SERVICES_PATH"

mkdir -p $DOWNLOAD_PATH $TOOLS_PATH $SERVICES_PATH

echo ">>> Installing dependencies..."
pacman -S git python3 podman
echo ">>> Done!"

echo ">>> Setuping tools..."
cd $TOOLS_PATH
git clone https://github.com/Raisess/maestro && cd maestro && NO_SUDO=1 ./install.py && cd ..
git clone https://github.com/Raisess/pingr && cd pingr && NO_SUDO=1 ./install.py && cd ..
git clone https://github.com/Raisess/dbc && cd dbc && NO_SUDO=1 ./install.py && cd ..
echo ">>> Done!"

rm -rf $DOWNLOAD_PATH

cd /home/$USER
