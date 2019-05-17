#!/bin/sh
# Απαραίτητο να έχει εγκατασταθεί το node

install(){
  npm install -g npm #update npm
  npm install -g --unsafe-perm node-red # Χωρίς nvm απαιτείται sudo
}
install

# NOT WORKING με .config πρόβλημα
