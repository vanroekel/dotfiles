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

ln -s ${PWD}/bash/.bashrc ~/.bashrc
ln -s ${PWD}/bash/.bash_profile ~/.bash_profile
ln -s ${PWD}/bash/.bash_aliases ~/.bash_aliases

CUSTOM_FILES=`ls bash-it-custom/`
for FILE in ${CUSTOM_FILES}
do
	ln -sf ${PWD}/bash-it-custom/${FILE} ~/.bash_it/custom/.
done

ln -s ${PWD}/vim/.vimrc ~/.vimrc
if [ ! -d ~/.vim/bundle/vundle/spell ]; then
  mkdir ~/.vim/bundle/vundle/spell
fi
ln -s ${PWD}/vim/.vimspell.en.utf-8.add ~/.vim/bundle/vundle/spell/en.utf-8.add
ln -s ${PWD}/vim/.gvimrc ~/.gvimrc
ln -s ${PWD}/vim/.vimrc.bundles ~/.vimrc.bundles
ln -s ${PWD}/tmux/.tmux.conf ~/.tmux.conf
ln -s ${PWD}/screen/.screenrc ~/.screenrc

ln -s ${PWD}/git/.gitconfig ~/.
ln -s ${PWD}/git/.git-completion.bash ~/.
ln -s ${PWD}/git/core_excludes ~/.git_core_excludes

git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

vim -u ~/.vimrc.bundles +BundleInstall +q

###### MAC OSX Specifics ####################
# install osx-trash if on macosx
sudo gem install osx-trash
brew install ack
