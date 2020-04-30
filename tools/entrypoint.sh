#!/bin/sh

sudo chgrp -Rf ${USER} ${WORKDIR}

if [ -e "${WORKDIR}/package.json" ]; then    
    if [ ! -d "${WORKDIR}/node_modules" ]; then
        npm install
        npm cache clean --force
    fi

    export PATH="${PATH}:${WORKDIR}/node_modules/.bin"
fi

if [ -z "$(/usr/bin/which -- $1)" ]; then
    npm run "$@"
else
    exec "$@"
fi