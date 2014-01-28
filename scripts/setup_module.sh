#!/bin/bash
GREP=`which grep`
NEED_TO_SOURCE=`hostname | ${GREP} '.lanl.gov'`
MACOSX=`uname | ${GREP} 'Darwin'`
if [ -n "${NEED_TO_SOURCE}" ]; then
  if [ -z "${MACOSX}" ]; then
    source /usr/share/Modules/init/bash
    source ~/scripts/mustang_intel_openmpi.sh
  fi
fi
