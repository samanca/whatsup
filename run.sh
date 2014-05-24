#!/bin/bash
if [ -z "$1" ]; then
    MAX_CLIENTS=10
else
    MAX_CLIENTS=$1
fi

COUNTER=0
while [ $COUNTER -lt $MAX_CLIENTS ]; do
    let COUNTER=COUNTER+1
    USER=$COUNTER
    PASSWORD=$COUNTER
    ./client_bot.sh "$USER" "$PASSWORD" | java -cp client/dist/lib/smack-3.4.1-0cec571.jar:client/dist/lib/client.jar:client/dist/lib/smackx-3.4.1-0cec571.jar com.ucsd.whatsup.Main &
done
