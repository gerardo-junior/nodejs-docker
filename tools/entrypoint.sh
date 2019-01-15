#!/bin/sh
sudo chgrp -Rf ${USER} ${WORKDIR}

if [ ! -d "$(pwd)/node_modules" ]; then
    if [ -e "$(pwd)/yarn.lock" ]; then
        /usr/local/bin/yarn install --pure-lockfile
        /usr/local/bin/yarn cache clean --force
    elif [ -e "$(pwd)/package.json" ]; then
        /usr/local/bin/npm install
        /usr/local/bin/npm cache clean --force
    fi
fi

export PATH="${PATH}:${WORKDIR}/node_modules/.bin"

if [[ -z "$(which -- $1)" ]]; then
    /usr/local/bin/npm run "$@"
else
    exec "$@"
fi