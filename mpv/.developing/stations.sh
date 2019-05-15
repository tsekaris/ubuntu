#!/bin/sh

connect () {
    pkill mpv
    mpv $1
}

action () {
    dir=$(dirname $0)
    station=$(cat $dir/stations | awk '{print $1}' | fzf)
    url=$(awk '/'"${station}"'/{print $2}' $dir/stations)

    if [ -z "$url" ]
    then
        echo "Not a station."
    else
        #tmux a -t $station || tmux new -s $station "pkill mpv; mpv $url"
        tmux new -s radio -n $station "pkill mpv; mpv $url" 
    fi
}
tmux a -t radio || action
