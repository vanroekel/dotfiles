NEED_TO_SOURCE=`hostname | grep '.lanl.gov'`

if [ -n "${NEED_TO_SOURCE}" ]; then
    source /usr/share/Modules/init/bash
fi
