#!/bin/sh

# --all : δημιουργειτε ένα .fzf.bash που γίνεται source με το .bashrc. επιλέγουμε auto_completio, key_binding, update_config. Με το --all δεν μας κάνει ερωτήσεις. 

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
