#! /usr/bin/env sh

echo "Updating maestro..."

PASSWORD_FILE_PATH=/usr/local/etc/maestro/password.json

maestro kill maestro-serve
cd /tmp
cp $PASSWORD_FILE_PATH .
git clone https://github.com/Raisess/maestro
cd ./maestro
NO_SUDO=1 ./install.py
cd ..
rm -rf ./maestro
cp password.json $PASSWORD_FILE_PATH
maestro run maestro-serve

echo "Done!"
