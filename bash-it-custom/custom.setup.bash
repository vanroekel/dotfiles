#########################################################################################
#					Set Commands for Terminal History Search							#
#########################################################################################
set filec
set history = 100 
set savehist = 100 

bind -r "\e[A"
bind -r "\e[B"
bind -r "\e[1;5C"
bind -r "\e[1;5D"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'

ON_UBUNTU=`uname -a | grep "Ubuntu"`

export PATH="${PATH}:${HOME}/scripts"
