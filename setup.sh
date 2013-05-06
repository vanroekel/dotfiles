#!/bin/bash
BASH_IT_ADDR="git@github.com:douglasjacobsen/bash-it.git"
VUNDLE_ADDR="git@github.com:gmarik/vundle.git"

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

ln -s ${PWD}/vim/.vimrc ~/.vimrc
ln -s ${PWD}/vim/.vimrc.bundles ~/.vimrc.bundles

cp git/.gitconfig ~/.

git config --global core.excludesfile = "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

vim -u ~/.vimrc.bundles +BundleInstall +q
