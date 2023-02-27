#! /usr/bin/env bash

# @DESCRIPTION: This script setup an raspberry pi using Arch Linux ARM to be used
# as a home server.
# @NOTE: To be executed in the raspberry pi (su mode).

HOME_PATH=/home/$USER
TOOLS_PATH=$HOME_PATH/tools
SERVICES_PATH=$HOME_PATH/services

echo "ArchPI Server Setup | TOOLS_PATH: $TOOLS_PATH / SERVICES_PATH: $SERVICES_PATH"

mkdir -p $TOOLS_PATH $SERVICES_PATH

echo ">>> Installing dependencies..."
pacman -S git python3 podman
echo ">>> Done!"

echo ">>> Setuping tools..."
cd $TOOLS_PATH
git clone https://github.com/Raisess/maestro && cd maestro && NO_SUDO=1 ./install.py && cd ..
git clone https://github.com/Raisess/pingr && cd pingr && NO_SUDO=1 ./install.py && cd ..
git clone https://github.com/Raisess/dbc && cd dbc && NO_SUDO=1 ./install.py && cd ..
echo ">>> Done!"

echo ">>> Setuping services..."
cd $SERVICES_PATH
maestro create maestro-serve "maestro serve"

echo "[
  {
    \"name\": \"Some service\",
    \"protocol\": \"http\",
    \"host\": \"localhost\",
    \"port\": 8080,
    \"routes\": [
      \"/health/ping\",
      \"/health/status\"
    ]
  }
]" > services.json
echo ">>> Done!"

cd $HOME_PATH
