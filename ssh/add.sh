#!/bin/sh

#Εμφάνιση των tags χωρίς το prefix.
prefix=${HOME}/.ssh/
#Το -L απαραίτητο για συντομεύσεις
key_public=${prefix}$(find -L ~/.ssh -name "*.pub" | awk '{ gsub("'${prefix}'","",$1); print $1 }'| fzf)
key_private=${key_public%????} #Βγάλε το .pub
if [ -f ${key_public} ]
then
    ssh-add ${key_private}
fi
