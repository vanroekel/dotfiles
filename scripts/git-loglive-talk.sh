#!/bin/bash

while :
do
	clear
	#git --no-pager log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Creset' --abbrev-commit --date=relative --all
	git logg --all
	sleep 1
done
