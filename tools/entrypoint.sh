#!/bin/sh

exec_with_root_permission () {  
    if [ ${EUID} -ne 0 ] 
        exec "$@"
    elif [ -e '/usr/bin/sudo' ]; then
        /usr/bin/sudo "$@"
    else
        echo -e "\e[31mUnable to run \"${@}\" commad with root permission\e[0m" 
    fi
}

exec_with_root_permission /bin/chgrp -Rf ${USER} ${WORKDIR}

if [ -e "${WORKDIR}/yarn.lock" ]; then 
    NODE_MANAGER='yarn'
else 
    NODE_MANAGER='npm'
fi

if [ -e "${WORKDIR}/package.json" ]; then    
    if [ ! -d "${WORKDIR}/node_modules" ]; then
        /usr/local/bin/${NODE_MANAGER} install
        /usr/local/bin/${NODE_MANAGER} cache clean --force
    fi

    export PATH="${PATH}:${WORKDIR}/node_modules/.bin"
fi

if [ ! -z "$1" ]; then
    if [[ -z "$(/usr/bin/which -- $1)" ]]; then
        /usr/local/bin/${NODE_MANAGER} run "$@"
    else
        exec "$@"
    fi
fi

exit 1
