#!/bin/sh
sudo apt-get update -y
sudo apt-get upgrade -y
mkdir ~/0
for script in $HOME/.0/*/.install.sh
do
    sh "$script"
done
