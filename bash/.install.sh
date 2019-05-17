#!/bin/sh

# Append στο bashrc που ήδη το ubuntu έχει γράψει σε αυτό
bashrc="~/.0/bash/.dotfiles/.bashrc"
line="[ -f $bashrc ] && source $bashrc #tsekaris" 
grep -Fxq "$line" ~/.bashrc || echo "$line" >> ~/.bashrc
