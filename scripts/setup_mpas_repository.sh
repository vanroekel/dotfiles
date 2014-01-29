#!/bin/bash

O_AUTH_TOKEN="OAUTH_TOKEN_HERE"
GITHUB_USERNAME="GITHUB_USERNAME_HERE"

SHARED_REPOS="MPAS MPAS-Documents MPAS-Tools MPAS-Testing MPAS-Scratch"

ROOT_DIR=`pwd`

ERROR=0

if [ "${O_AUTH_TOKEN}" == "OAUTH_TOKEN_HERE" ]; then
	echo "Please create an OAuth token at github.com and set the O_AUTH_TOKEN variable equal to it in this script."
	ERROR=1
fi

if [ "${GITHUB_USERNAME}" == "GITHUB_USERNAME_HERE" ]; then
	echo "Please set the GITHUB_USERNAME variable equal to your github username in this script."
	ERROR=1
fi

if [ ${ERROR} == 1 ]; then
	exit
fi

for SHARED_REPO in ${SHARED_REPOS}
do
	DIR_NAME=`echo "${SHARED_REPO}" | tr '[:upper:]' '[:lower:]' | tr '-' '_'`

	if [ "$DIR_NAME" != "mpas" ]; then
		WORK_DIR_NAME=`echo ${DIR_NAME} | sed "s/mpas_//g"`
	else 
		WORK_DIR_NAME=${DIR_NAME}
	fi

	mkdir -p ${WORK_DIR_NAME}
	cd ${WORK_DIR_NAME}

	curl -s -H "Authorization: TOKEN ${O_AUTH_TOKEN}" -X POST -i https://api.github.com/repos/MPAS-Dev/${SHARED_REPO}/forks &> /dev/null

	echo "Cloning shared repository ${SHARED_REPO}"
	git clone git@github.com:MPAS-Dev/${SHARED_REPO}.git ${DIR_NAME}_repo &> /dev/null

	cd ${DIR_NAME}_repo

	git remote rename origin MPAS-Dev/${SHARED_REPO} &> /dev/null

	FORK_URL="https://api.github.com/repos/MPAS-Dev/${SHARED_REPO}/forks"
	FORK_LIST=`curl -s -H "Authorization: TOKEN ${O_AUTH_TOKEN}" -i ${FORK_URL} | grep '"full_name"' | awk '{print $2}' | sed "s/,//g" | sed "s/\"//g"`

	for FORK in ${FORK_LIST}
	do
		echo "    Adding remote: ${FORK}"
		git remote add ${FORK} git@github.com:${FORK}.git &> /dev/null
	done

	echo "    Fetching remote history."
	git fetch --all  &> ${ROOT_DIR}/fetch_progress
	git fetch --tags &> /dev/null
	NEW_BRANCHES=`grep "\[new branch\]" ${ROOT_DIR}/fetch_progress | wc -l`
	echo "    Added ${NEW_BRANCHES} remote tracking branches"
	rm ${ROOT_DIR}/fetch_progress

	cd ${ROOT_DIR}
done
