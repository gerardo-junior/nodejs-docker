#!/bin/sh
sudo chgrp -Rf $(whoami) ./

if [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm install
fi

export PATH="${PATH}:${WORKDIR}/node_modules/.bin"

if [ ! -d "$(pwd)/.nuxt" ]; then
    /usr/local/bin/npm run build
fi

if [[ ! -z "$1" ]]; then
    if [[ -z "$(which -- $1)" ]]; then
        /usr/local/bin/npm run "$@"
    else
        exec "$@" 
    fi 
elif [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm run start
fi