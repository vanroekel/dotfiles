#!/bin/bash

cp bash/.bashrc ~/.
cp bash/.bash_profile ~/.

CUSTOM_FILES=`ls bash-it-custom/`
for FILE in ${CUSTOM_FILES}
do
	ln -s ${PWD}/bash-it-custom/${FILE} ~/.bash_it/custom/.
done

cp ${PWD}/git/.gitconfig ~/.
git config --global core.excludesfile = "${PWD}/git/core_excludes"

mkdir -p ~/scripts
cp -R scripts/* ~/scripts/.

vim -u ~/.vimrc.bundles +BundleInstall +q
