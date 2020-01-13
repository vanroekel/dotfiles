#!/bin/bash
BASH_IT_ADDR="git@github.com:vanroekel/bash-it.git"
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

if [ -f ~/.bash_aliases ]; then
    mkdir -p ~/BashBackups
    mv ~/.bash_aliases ~/BashBackups/.
fi

if [ -f ~/.login ]; then
    mkdir -p ~/tcshBackups
    mv ~/.login ~/tcshBackups/.
fi

if [ -f ~/.tmux.conf ]; then
    mkdir -p ~/tmuxBackup
    mv ~/.tmux.conf ~/tmuxBackup/.
fi

if [ -f ~/.screenrc ]; then
    mkdir -p ~/screenrcBackup
    mv ~/.screenrc ~/screenrcBackup/.
fi

if [ -f ~/.screenrc ]; then
    mkdir -p ~/screenrcBackup
    mv ~/.screenrc ~/screenrcBackup/.
fi

if [ -f ~/.gitconfig ]; then
    mkdir -p ~/gitBackup
    mv ~/.gitconfig ~/gitBackup/.
fi

if [ -f ~/.git-completion.bash ]; then
    mkdir -p ~/gitBackup
    mv ~/.git-completion.bash ~/gitBackup/.
fi

if [ -f ~/.git_core_excludes ]; then
    mkdir -p ~/gitBackup
    mv ~/.git_core_excludes ~/gitBackup/.
fi

if [ -f ~/.git_template ]; then
  mkdir -p ~/.git_template
  mv git/hooks ~/.git_template/hooks
fi 

git clone ${VUNDLE_ADDR} ~/.vim/bundle/Vundle.vim
git clone ${BASH_IT_ADDR} ~/.bash_it

~/.bash_it/install.sh

ln -sf ${PWD}/bash/.bashrc ~/.bashrc
ln -sf ${PWD}/bash/.bash_profile ~/.bash_profile
ln -sf ${PWD}/bash/.bash_aliases ~/.bash_aliases
ln -sf ${PWD}/tcsh/.login ~/.login

CUSTOM_FILES=`ls bash-it-custom/`
for FILE in ${CUSTOM_FILES}
do
	ln -sf ${PWD}/bash-it-custom/${FILE} ~/.bash_it/custom/.
done

ln -s ${PWD}/vim/.vimrc ~/.vimrc
if [ ! -d ~/.vim/bundle/Vundle.vim/spell ]; then
  mkdir ~/.vim/bundle/Vundle.vim/spell
fi
if [ ! -d ~/.vim/undodir ]; then
  mkdir ~/.vim/undodir
fi
ln -s ${PWD}/vim/.vimspell.en.utf-8.add ~/.vim/bundle/Vundle.vim/spell/en.utf-8.add
ln -s ${PWD}/vim/.gvimrc ~/.gvimrc
ln -s ${PWD}/vim/.vimrc.bundles ~/.vimrc.bundles
ln -s ${PWD}/tmux/.tmux.conf ~/.tmux.conf
ln -s ${PWD}/screen/.screenrc ~/.screenrc

if [ ! -d ~/.vim/after/syntax/ ]; then 
  mkdir -p ~/.vim/after/syntax/
fi
ln -sf ${PWD}/vim/tex.vim ~/.vim/after/syntax/tex.vim

ln -s ${PWD}/git/.gitconfig ~/.
ln -s ${PWD}/git/.git-completion.bash ~/.
ln -s ${PWD}/git/core_excludes ~/.git_core_excludes

ln -s ${PWD}/pdb/.pdbrc ~/.pdbrc

ln -s ${PWD}/Xterm/.Xdefaults ~/.Xdefaults
# merge results into default xterm settings
xrdb -merge Xterm/.Xdefaults
xrdb -merge Xterm/solarized

#git config --global core.excludesfile "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.
#ln ${PWD}/scripts ~/scripts

vim -u ~/.vimrc.bundles +BundleInstall +q

ln -s ${PWD}/vim/scripts.vim ~/.vim/scripts.vim

###### MAC OSX Specifics ####################
# install osx-trash if on macosx
if [ `uname` == 'Darwin' ]; then 
  # http://superuser.com/questions/694433/install-gem-for-older-ruby-1-8-on-mac-os-x-10-9-maverics
  sudo gem install osx-trash
  brew install ack
fi

#if [ `uname` == 'Linux' ]; then
#  git clone git@github.com:Homebrew/linuxbrew.git ~/.linuxbrew
#fi
