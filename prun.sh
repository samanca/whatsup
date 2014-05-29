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

mkdir -p pid
rm -rf pid/*

# load
touch /tmp/whatsUp.lock

COUNTER=$START
while [ $COUNTER -le $END ]; do
    USER=$COUNTER
    PASSWORD="root"
    java -cp client/dist/lib/smack-3.4.1-0cec571.jar:client/dist/lib/client.jar:client/dist/lib/smackx-3.4.1-0cec571.jar com.ucsd.whatsup.Main < "load/${COUNTER}.txt" > /dev/null & echo $! >"pid/${COUNTER}.pid"
    let COUNTER=COUNTER+1
done

# barrier
sleep 1m
rm /tmp/whatsUp.lock

COUNTER=$START
while [ $COUNTER -le $END ]; do
    # following line is commented as the bash script cannot access a process outside its scope 
    # wait $(<"pid/${COUNTER}.pid")
    while [ -e /proc/$(<"pid/${COUNTER}.pid") ]; do sleep 0.1; done
    let COUNTER=COUNTER+1
done

echo "FINISHED PHASE(1)!"
rm -rf pid/*

# run
touch /tmp/whatsUp.lock

COUNTER=$START
while [ $COUNTER -le $END ]; do
    USER=$COUNTER
    PASSWORD="root"
    java -cp client/dist/lib/smack-3.4.1-0cec571.jar:client/dist/lib/client.jar:client/dist/lib/smackx-3.4.1-0cec571.jar com.ucsd.whatsup.Main < "run/${COUNTER}.txt" > /dev/null &
    let COUNTER=COUNTER+1
done

# barrier
sleep 1m
rm /tmp/whatsUp.lock
