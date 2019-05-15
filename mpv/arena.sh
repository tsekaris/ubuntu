#!/bin/sh

station=arena
url=http://eco.onestreaming.com:8418/;stream.mp3 

pkill mpv
mpv $url
#tmux a -t radio-$station || tmux new-session -s radio-$station -n mpv "pkill mpv; mpv $url" 
