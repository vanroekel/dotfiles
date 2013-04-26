NEED_TO_SOURCE=`hostname | grep '.lanl.gov'`

if [ -n "${NEED_TO_SOURCE}" ]; then
    source /usr/share/modules/init/bash
fi
