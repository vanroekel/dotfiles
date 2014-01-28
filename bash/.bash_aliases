# User specific aliases and functions
alias rm='rm -i'
alias matlabline='matlab -r -nosplash -nodisplay -nojvm'
alias lsdir="ls -l | grep '^d'"
#alias suntansconvert="hexdump -v -e '4/8 \"%15E \"' -e '\"\n\"'"
alias codecount="ls *.[c-h] | xargs wc "
alias doxygencommentsready="ls *.[c-h] | xargs sed -i 's/\/\*/\/\*\*/g'"
alias cleandoxygencommentsready="ls *.[c-h] | xargs sed -i 's/\/\*\+/\/\*\*/g'"
alias vi='vim'

# git aliases
alias gco='git co'
alias gci='git ci'
alias grb='git rb'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always'
    alias less='less -R'
    alias dir='dir --color=always'
    alias vdir='vdir --color=always'

    alias cgrep='grep --color=always -n'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
