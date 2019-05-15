#!/bin/sh

sudo apt-get install vim -y
cd $HOME/.0/vim
stow --target=$HOME .dotfiles
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
