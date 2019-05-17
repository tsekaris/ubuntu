#!/bin/sh

# Προτιμάμε την τελευταία LTS έκδοση.
# Από NodeSource.
sudo apt-get install curl -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install nodejs -y
npm install -g npm
# node-red install που προτιμάει nodejs LTS έκδοση
# sudo npm install -g --unsafe-perm node-red
