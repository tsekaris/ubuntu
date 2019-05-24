#!/bin/sh

ubuntu(){
  sudo apt-get install vim -y
}

ppa(){
  sudo apt-get install software-properties-common -y #Χρήση ppa στο λειτουργικό
  sudo add-apt-repository ppa:jonathonf/vim -y
  sudo apt-get install vim -y
}

ppa
cd $HOME/.0/vim
stow --target=$HOME .dotfiles
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
