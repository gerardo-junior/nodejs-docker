#!/bin/sh

if [ ! ${EUID} -ne 0 ]; then 
    /usr/bin/sudo /bin/chgrp -Rf ${USER} ${WORKDIR}
fi

if [ -e "${WORKDIR}/package.json" ]; then    
    if [ ! -d "${WORKDIR}/node_modules" ]; then
        /usr/local/bin/npm install
        /usr/local/bin/npm cache clean --force
    fi

    export PATH="${PATH}:${WORKDIR}/node_modules/.bin"
fi

if [ -z "$(/usr/bin/which -- $1)" ]; then
    /usr/local/bin/npm run "$@"
else
    exec "$@"
fi