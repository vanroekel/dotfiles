#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
#export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='demula'

# -- EHH -- export BASH_IT_THEME='doubletime'

export BASH_IT_THEME='envy'

# -- EHH -- export BASH_IT_THEME='mbriggs'
# -- EHH -- export BASH_IT_THEME='rainbowbrite'
# -- EHH -- export BASH_IT_THEME='rjorgenson' #  I like the prompt, don't understand the T:0 and don't like the colors.
export BASH_IT_THEME='zork'
export BASH_IT_THEME='colorful'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'

# Set the path nginx
#export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK


# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

export BASH_PROFILE_SOURCED=yes

if [ -f ~/.bashrc ]; then
    if [ -z ${BASHRC_SOURCED} ]; then
        source ~/.bashrc
    fi
fi
# Set LANG to en_US.utf8
export LANG=en_US.UTF-8

# Load Bash It
source $BASH_IT/bash_it.sh


# for MACOSX
platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == "Darwin" ]]; then
  platform='macosx'
else
  platform='nix'
fi

if [ $platform == 'nix' ]; then #{{{
  # instsall homebrew for linux
  #git clone git@github.com:Homebrew/linuxbrew.git ~/.linuxbrew
  export PATH="/users/pwolfram:/turquoise/users/pwolfram:$HOME/.linuxbrew/bin:$PATH"
  export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi  #}}}

if [ $platform == 'macosx' ]; then  #{{{
  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagacad
  export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
  #export GREP_OPTIONS='--color=auto'
  # export CLICOLOR=1
  # export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

  alias ls='CLICOLOR_FORCE=1 ls -G'
  alias less='less -R'
  alias dir='dir --color=always'
  alias vdir='vdir --color=always'

  alias cgrep='grep --color=always -n'
  alias fgrep='fgrep --color=always'
  alias egrep='egrep --color=always'

  ##
  # Your previous /Users/pwolfram/.bash_profile file was backed up as /Users/pwolfram/.bash_profile.macports-saved_2014-01-07_at_16:00:10
  ##

  source `brew --repository`/Library/Contributions/brew_bash_completion.sh

  export PATH=/usr/local/bin:/usr/local/sbin:$PATH


  #export PYTHONDIR=/Library/Frameworks/Python.framework/Versions/2.7/bin
  #export PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/2.7/bin
  ##export PYTHONPATH=$PYTHONPATH:/Users/pwolfram/Library/Enthought/Canopy_64bit/User/lib/python2.7/site-packages
  #export PYTHONPATH=$PYTHONPATH:/Applications/Canopy.app/appdata/canopy-1.0.1.1189.macosx-x86_64/Canopy.app/Contents/lib/python2.7/site-packages
  #
  #export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
  
  # Added by Canopy installer on 2014-01-10
  # VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
  export VIRTUAL_ENV_DISABLE_PROMPT=1; source /Users/pwolfram/Library/Enthought/Canopy_64bit/User/bin/activate
  alias python-epd="bash -c ' export VIRTUAL_ENV_DISABLE_PROMPT=1; source /Users/pwolfram/Library/Enthought/Canopy_64bit/User/bin/activate; python '"
  alias ipython-epd="bash -c ' export VIRTUAL_ENV_DISABLE_PROMPT=1; source /Users/pwolfram/Library/Enthought/Canopy_64bit/User/bin/activate; ipython '"

  # git completion 
  source ~/.git-completion.bash
  
  #export PATH=~/Documents/MPAS:usr/texbin:$PATH
  export PATH=usr/texbin:$PATH
  #export http_proxy=http://proxyout.lanl.gov:8080
  #export https_proxy=https://proxyout.lanl.gov:8080
  #export all_proxy=proxy.lanl.gov:8080
  ##export ftp_proxy="http://proxyout.lanl.gov"
  #export no_proxy="*.lanl.gov"

  alias xdvi='xdvik -geometry 1200x1445+1360+0 -s 5'
  alias gidb='ddd --debugger "/usr/bin/idb"'


  # MPAS variables
  export NETCDF=/opt/netcdf-4.1.3/
  export PNETCDF=/opt/parallel-netcdf-1.4.1/
  export PIO=/opt/pio-1.7.1/

  alias updatedb="sudo /usr/libexec/locate.updatedb"

  #generalized colors
  source "`brew --prefix grc`/etc/grc.bashrc"

  # alias for installed, native OS X applications
  alias skim='/Applications/Skim.app/Contents/MacOS/Skim'
  alias lyx='/Applications/LyX.app/Contents/MacOS/lyx NotesSomaRadiallyConst.lyx'
  # make sure MacOSX inherits correct variables for launcher
  #launchtcl setenv PATH $PATH

  source /opt/intel/composer_xe_2013_sp1.2.139/bin/compilervars.sh intel64

  alias gvim='mvim'
fi #}}}
