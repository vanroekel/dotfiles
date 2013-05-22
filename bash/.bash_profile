#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

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
export NGINX_PATH='/opt/nginx'

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
