#! /usr/bin/env bash

# @DESCRIPTION: This script setup an raspberry pi using Arch Linux ARM to be used
# as a home server.
# @NOTE: To be executed in the raspberry pi (su mode).

TOOLS_PATH=/home/$USER/tools
SERVICES_PATH=/home/$USER/services

echo "ArchPI Server Setup | TOOLS_PATH: $TOOLS_PATH / SERVICES_PATH: $SERVICES_PATH"

mkdir -p TOOLS_PATH SERVICES_PATH

echo ">>> Installing dependencies..."
pacman -S git python3 podman
echo ">>> Done!"

echo ">>> Setuping tools..."
cd TOOLS_PATH
git clone https://github.com/Raisess/maestro && NO_SUDO=1 ./install.py
git clone https://github.com/Raisess/pingr && NO_SUDO=1 ./install.py
git clone https://github.com/Raisess/dbc && NO_SUDO=1 ./install.py
cd /home/$USER
echo ">>> Done!"

echo ">>> Setuping services..."
cd SERVICES_PATH
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
cd /home/$USER
echo ">>> Done!"
