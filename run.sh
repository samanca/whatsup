#!/bin/bash

if [ -z "$1" ]; then
    MAX_CLIENTS=100
else
    MAX_CLIENTS=$1
fi

mkdir -p run
mkdir -p load

COUNTER=0
while [ $COUNTER -lt $MAX_CLIENTS ]; do
    let COUNTER=COUNTER+1
    USER=$COUNTER
    PASSWORD="root"
    ./client_bot_2.sh "$USER" "$PASSWORD" "$MAX_CLIENTS"
done
