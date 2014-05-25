#!/bin/bash
if [ -z "$1" ]; then
    START=1
else
    START=$1
fi

if [ -z "$2" ]; then
    END=100
else
    END=$2
fi

COUNTER=$START
while [ $COUNTER -le $END ]; do
    USER=$COUNTER
    PASSWORD="root"
    echo $USER
    java -cp client/dist/lib/smack-3.4.1-0cec571.jar:client/dist/lib/client.jar:client/dist/lib/smackx-3.4.1-0cec571.jar com.ucsd.whatsup.Main < "stdin/${COUNTER}.txt" &
    let COUNTER=COUNTER+1
done
