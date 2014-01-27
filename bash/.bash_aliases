# User specific aliases and functions
alias rm='rm -i'
alias ll='ls -alh'
alias matlabline='matlab -r -nosplash -nodisplay -nojvm'
alias lsdir="ls -l | grep '^d'"
alias suntansconvert="hexdump -v -e '4/8 \"%15E \"' -e '\"\n\"'"
alias codecount="ls *.[c-h] | xargs wc "
alias doxygencommentsready="ls *.[c-h] | xargs sed -i 's/\/\*/\/\*\*/g'"
alias cleandoxygencommentsready="ls *.[c-h] | xargs sed -i 's/\/\*\+/\/\*\*/g'"
alias backupmfiles="make -C ~/Papers/wolfram-11/mfiles/"

# git aliases
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
