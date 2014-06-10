#!/bin/bash
MODE="openfire"
if [ "$1" = "start" ]
then
    echo "starting ..."
    for SERVER in "$@"
    do
        ssh "$SERVER" "cd whatsup && git pull && cd ~/whatsup/tools/${MODE}/start.sh" &
    done
elif [ "$1" = "stop" ]
then
    echo "stopping ..."
    mkdir -p "logs"
    mkdir -p "logs/${MODE}"
    
    PATH="logs/${MODE}/last_run"
    mkdir -p "$PATH"

    for SERVER in "@"
    do
        mkdir -p "${PATH}/${SERVER}"
        scp -r "${SERVER}:~/whatsup/tools/${MODE}/logs/*" "${PATH}/${SERVER}"
        ssh "$SERVER" "reboot"
    done
else
    echo "invalid command - expected start or stop!"
fi
