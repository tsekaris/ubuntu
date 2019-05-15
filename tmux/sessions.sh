#!/bin/sh

#tmux new-session -d -s pc "sh $(find -L ~/.0 -name "*.sh"| fzf)" # -L: και για τις συντομεύσεις
tmux a -t $(tmux ls | awk '{ gsub(":","",$1); print $1 }' | fzf)

# Create session pc with window menu
#tmux new-session -s pc -n menu -d
# Create in session pc window radio in index 1
#tmux new-window -t pc:1 -n radio -d
# Create in session pc window test in last index
#tmux new-window -t pc -n test -d
# Select window test on pc session
#tmux select-window -t pc:test
# Attach the previous selected session (pc) and test window 
#tmux a
# List of windows in session. Show only windows names
#tmux lsw -t pc -F "#W"
