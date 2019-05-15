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
