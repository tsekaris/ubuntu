#!/bin/sh

station=rainbow
url=http://62.212.82.197:8000

pkill mpv
mpv $url
#tmux a -t radio-$station || tmux new-session -s radio-$station -n mpv "pkill mpv; mpv $url" 
