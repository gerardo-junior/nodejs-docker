#!/bin/sh

if [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm install
fi

/usr/local/bin/npm run build

if [[ ! -z "$1" ]]; then
    if [[ -z "$(which -- $1)" ]]; then
        /usr/local/bin/npm run "$@"
    else
        exec "$@" 
    fi 
elif [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm run start
fi