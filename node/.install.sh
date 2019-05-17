#!/bin/sh

# Προτιμάμε την τελευταία LTS έκδοση.
# Από NodeSource.
nodesource(){
  sudo apt-get install curl -y
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  sudo apt-get install nodejs -y
  sudo npm install -npm # install
}

# nvm
nvm(){
  sudo apt-get install curl -y
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  #source ~/.bashrc #Δεν λειτουργεί.
  exec bash
  nvm install 10.15.1
  nvm use 10.15.1
  nvm alias default 10.15.1
  npm install -g npm
  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
}

# node-red install που προτιμάει nodejs LTS έκδοση
red(){
  npm install -g npm #update npm
  npm install -g --unsafe-perm node-red # Χωρίς nvm απαιτείται sudo
}

nvm
red
