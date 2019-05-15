#!/bin/sh

#remove default
rm $HOME/.bashrc
cd $HOME/.0/bash
stow --target=$HOME .dotfiles
