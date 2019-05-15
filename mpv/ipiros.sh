#!/bin/sh

station=ipiros
url=http://213.239.206.179:9450

pkill mpv
mpv $url
#tmux a -t radio-$station || tmux new-session -s radio-$station -n mpv "pkill mpv; mpv $url" 
