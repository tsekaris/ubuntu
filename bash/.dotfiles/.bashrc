# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Until here default
# tsekaris
#alias paok="echo 'paokra ole'"

menu () {
    echo $@ | fmt -1 | fzf
}

pc () {
    #Οι εντολές εκτελούνται με bash για να δουλέψουμε με τα search με /.
    #Το $HOME στο termux είναι μακρύ.
    prefix=${HOME}/.0/
    #Εμφάνιση των scripts χωρίς το prefix.
    #Το -L απαραίτητο για συντομεύσεις
    script=$(find -L ~/.0 -name "*.sh" ! -name ".install.sh" ! -name ".install_all.sh" | awk '{ gsub("'${prefix}'","",$1); print $1 }'| fzf)
    case "$1" in
        w)
            #Το όνομα του tmux window.
            #Χωρίς / που γίνεται -. Χωρίς .sh.
            window=$(echo $script | awk '{ gsub("/","-",$1); print $1 }' | awk '{ gsub(".sh","",$1); print $1 }')
            
            #2>/dev/null για να μην εμφανίζει τα σφάλματα.
            #Εμφάνιση των ονομάτων (#S) των tmux sessions.
            sessions=$(tmux ls -F "#S" 2>/dev/null)
            #Εμφάνιση των ονομάτων (#W) των windows του session pc.
            windows=$(tmux lsw -t pc -F "#W" 2>/dev/null)
            if [ -f ${prefix}${script} ] 
            then #Αν έχει επιλεχθεί script που υπάρχει.
                if [ -z $(echo $sessions | grep -w pc) ]
                then # Αν δεν υπάρχει το session pc.
                    tmux new -s pc -n ${window} -d "bash ${prefix}${script};exit"
                else #Αν υπάρχει το session pc.
                    if [ -z $(echo $windows | grep -w $window) ]
                    then #Αν υπάρχει το window.
                        tmux new-window -t pc -n ${window} -d "bash ${prefix}${script};exit"
                    #else #Αν υπάρχει το window.
                    fi
                fi
                tmux select-window -t pc:${window}
                tmux a -t pc
            else #Αν έχει επιλεχθεί script που δεν υπάρχει.
                tmux a -t pc || tmux new -s pc
            fi
            ;;
        s)
            #read -p "In progress." dummy
            session=$(echo $script | awk '{ gsub("/","-",$1); print $1 }' | awk '{ gsub(".sh","",$1); print $1 }')
            tmux a -t ${session} || tmux new -s ${session} "bash ${prefix}${script}"
            ;;
        *)
            if [ -f ${prefix}${script} ] 
            then #Αν έχει επιλεχθεί script που υπάρχει.
                bash ${prefix}${script}
            fi
            ;;
    esac
}

# Preventing nested ranger instances
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

# Ποιο γρήγορο shortcut για το nnn
n(){
    nnn -l #χωρίς details
}

# fzf dropdown list and not dropup
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
