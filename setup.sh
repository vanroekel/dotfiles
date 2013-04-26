#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
JANUS_ADDR="git@github.com:carlhuda/janus.git"
VUNDLE_ADDR="git@github.com:gmarik/vundle.git"
DOTFILES_ADDR="git@github.com:douglasjacobsen/dot_files.git"

if [ -f ~/.vim ]; then
    mkdir -p ~/VimBackups
    mv ~/.vim ~/VimBackups/.vim
fi

if [ -f ~/.vimrc ]; then
    mkdir -p ~/VimBackups
    mv ~/.vimrc ~/VimBackups/.vimrc
fi

if [ -f ~/.bashrc ]; then
    mkdir -p ~/BashBackups
    mv ~/.bashrc ~/BashBackups/.
fi

if [ -f ~/.bash_profile ]; then
    mkdir -p ~/BashBackups
    mv ~/.bash_profile ~/BashBackups/.
fi

git clone ${VUNDLE_ADDR} ~/.vim/bundle/vundle
git clone ${BASH_IT_ADDR} ~/.bash_it

~/.bash_it/install.sh

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

cp bash-it-custom/* ~/.bash_it/custom/.

#cp vim/.vimrc.before ~/.
#cp vim/.vimrc.after ~/.
ln -s vim/.vimrc ~/.vimrc

cp git/.gitconfig ~/.

#cp -R janus ~/.janus

cp -R scripts ~/scripts
