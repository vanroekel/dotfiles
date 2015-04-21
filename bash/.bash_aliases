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
    alias ls='ls --color=always -GFh'
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
alias cack='ack --color'
alias cack_ocean='ack --color --ignore-dir=src/core_atmosphere/ --ignore-dir=src/core_init_atmosphere/ --ignore-dir=src/core_landice/ --ignore-dir=src/core_sw/ --ignore-dir=DoxygenDocumentation'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# mac os x trash alias (doesn't quite work properly because the "put back" functionality is gone)
#alias trash='function _trash(){ echo "Trashing $1..."; mv $1 ~/.Trash; echo "Done";};_trash'

# rsync to act like scp
alias rsync-scp='rsync -avzP'

# lanl ICC
alias sshMustang='ssh -t -X wtrw1.lanl.gov ssh mu-fe.lanl.gov'

alias julia='/Applications/Julia-0.3.1.app/Contents/Resources/julia/bin/julia'
alias ijulia="ipython notebook --profile julia"

alias objcopy="/usr/local/Cellar/binutils/2.24/bin/gobjcopy"
alias objdump="/usr/local/Cellar/binutils/2.24/bin/gobjdump"
