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
    read -p "Press enter to continue." dummy
done
read -p "Press enter to reboot." dummy
sudo reboot
