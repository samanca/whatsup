#!/bin/bash

if [ -z "$1" ]; then
    MAX_CLIENTS=100
else
    MAX_CLIENTS=$1
fi

mkdir -p stdout
mkdir -p stderr
mkdir -p stdin

COUNTER=0
while [ $COUNTER -lt $MAX_CLIENTS ]; do
    let COUNTER=COUNTER+1
    USER=$COUNTER
    #PASSWORD="jack"
    PASSWORD="root"
    #./client_bot.sh "$USER" "$PASSWORD" "$MAX_CLIENTS" | java -cp client/dist/lib/smack-3.4.1-0cec571.jar:client/dist/lib/client.jar:client/dist/lib/smackx-3.4.1-0cec571.jar com.ucsd.whatsup.Main 1>"stdout/${COUNTER}.txt" 2>"stderr/${COUNTER}.txt" &
    #./client_bot.sh "$USER" "$PASSWORD" "$MAX_CLIENTS" | java -cp client/dist/lib/smack-3.4.1-0cec571.jar:client/dist/lib/client.jar:client/dist/lib/smackx-3.4.1-0cec571.jar com.ucsd.whatsup.Main &
    #java -cp client/dist/lib/smack-3.4.1-0cec571.jar:client/dist/lib/client.jar:client/dist/lib/smackx-3.4.1-0cec571.jar com.ucsd.whatsup.Main < "stdin/${COUNTER}.txt" &
    ./client_bot_2.sh "$USER" "$PASSWORD" "$MAX_CLIENTS" > "stdin/${COUNTER}.txt" 
done
