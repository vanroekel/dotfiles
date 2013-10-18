#!/bin/bash

COMPILER=$1

CORES=`ls src/ | grep "core_" | sed "s/core_//g"`

for CORE in ${CORES}
do
	make ${COMPILER} CORE=${CORE} &> /dev/null
	if [ -e ${CORE}_model ]; then
		SUCCESS=1
	else
		SUCCESS=0
	fi
	
	if [ "${SUCCESS}" == "1" ]; then
		echo "${CORE} passed"
	else
		echo " ** ${CORE} failed ** "
	fi

	make clean CORE=${CORE} &> /dev/null
done

