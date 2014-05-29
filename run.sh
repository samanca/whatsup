#!/bin/bash

if [ -z "$1" ]; then
    MAX_CLIENTS=100
else
    MAX_CLIENTS=$1
fi

if [ -z "$2" ]; then
    START_AT=1
else
    START_AT=$2
fi


mkdir -p run
mkdir -p load

COUNTER=0
while [ $COUNTER -lt $MAX_CLIENTS ]; do
    let USER=COUNTER+START_AT
    PASSWORD="root"
    ./client_bot_2.sh "$USER" "$PASSWORD" "$MAX_CLIENTS" "$START_AT"
    echo $USER
    let COUNTER=COUNTER+1
done
