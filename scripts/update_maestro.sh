#! /usr/bin/env sh

echo "Updating maestro..."

CONF_FILE_PATH=/usr/local/etc/maestro/conf.json

maestro kill maestro-serve
cd /tmp
cp $CONF_FILE_PATH .
git clone https://github.com/Raisess/maestro
cd ./maestro
NO_SUDO=1 ./install.py
cd ..
rm -rf ./maestro
cp conf.json $CONF_FILE_PATH
maestro run maestro-serve

echo "Done!"
