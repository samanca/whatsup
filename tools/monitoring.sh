#!/bin/bash
MODE="openfire"
if [ "$1" = "start" ]
then
    echo "starting ..."
    for SERVER in "$@"
    do
        if [ "$SERVER" = "start" ]
        then
            continue
        fi
        ssh "$SERVER" "cd whatsup && git pull && cd ~/whatsup/tools/${MODE} && ./start.sh" &
    done
elif [ "$1" = "stop" ]
then
    echo "stopping ..."
    mkdir -p "logs"
    mkdir -p "logs/${MODE}"
    
    TPATH="logs/${MODE}/last_run"
    mkdir -p "$TPATH"

    for SERVER in "$@"
    do
        if [ "$SERVER" = "stop" ]
        then
            continue
        fi

        mkdir -p "${TPATH}/${SERVER}"
        scp -r "${SERVER}:~/whatsup/tools/${MODE}/logs/*" "${TPATH}/${SERVER}"
        ssh "$SERVER" "sudo reboot"
    done
else
    echo "invalid command - expected start or stop!"
fi
