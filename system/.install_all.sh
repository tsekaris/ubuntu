#!/bin/sh
sudo apt-get update -y
sudo apt-get upgrade -y
mkdir ~/0
for script in $HOME/.0/*/.install.sh
do
    echo -----------------------------------------------------------------------------
    echo "Installing: $script"
    echo -----------------------------------------------------------------------------
    sh "$script"
done
read -p "Enter to reboot" dummy
sudo reboot
