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
	echo "Synchronizing remotes on ${SHARED_REPO}"

	DIR_NAME=`echo "${SHARED_REPO}" | tr '[:upper:]' '[:lower:]' | tr '-' '_'`

	if [ "$DIR_NAME" != "mpas" ]; then
		WORK_DIR_NAME=`echo ${DIR_NAME} | sed "s/mpas_//g"`
	else 
		WORK_DIR_NAME=${DIR_NAME}
	fi


	if [ ! -d ${WORK_DIR_NAME} -o ! -d ${WORK_DIR_NAME}/${DIR_NAME_REPO} ]; then
		echo "${SHARED_REPO} has not been setup properly. Skipping..."	
	else
		cd ${WORK_DIR_NAME}

		cd ${DIR_NAME}_repo

		FORK_URL="https://api.github.com/repos/MPAS-Dev/${SHARED_REPO}/forks"
		FORK_LIST=`curl -s -H "Authorization: TOKEN ${O_AUTH_TOKEN}" -i ${FORK_URL} | grep '"full_name"' | awk '{print $2}' | sed "s/,//g" | sed "s/\"//g"`

		REMOTES=`git remote -v | awk '{print $1}' | sort -u`

		for FORK in ${FORK_LIST}
		do
			IS_MPAS=`echo ${FORK} | grep "MPAS-Dev"`
			if [ "${IS_MPAS}" == "" ]; then
				RESULT=`echo ${REMOTES} | grep "${FORK}"`
				if [ "${RESULT}" == "" ]; then
					echo "   Adding ${FORK}"
					git remote add ${FORK} git@github.com:${FORK}.git &> /dev/null
				fi
			fi
		done

		for REMOTE in ${REMOTES}
		do
			IS_MPAS=`echo ${REMOTE} | grep "MPAS-Dev"`
			if [ "${IS_MPAS}" == "" ]; then
				RESULT=`echo ${FORK_LIST} | grep "${REMOTE}"`
				if [ "${RESULT}" == "" ]; then
					git remote remove ${REMOTE} &> /dev/null
					echo "   Removing ${REMOTE}"
				fi
			fi
		done

		echo "   Fetching updated history."
		git fetch --all  &> /dev/null
		git fetch --tags &> /dev/null

		cd ${ROOT_DIR}
	fi
done
