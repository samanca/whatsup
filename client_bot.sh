#!/bin/bash
NUM_MESSAGES=10
NUM_CONTACTS=10
TOTOAL_CONTACTS=100
DOMAIN_NAME="localhost"

sleep 2s
echo "$1@$DOMAIN_NAME"
sleep 1s
echo "$2"
sleep 1s

# remove all existing contacts
echo "remove-all"
sleep 5s

# add new contacts
declare -a CONTACTS
COUNTER=0
while [ $COUNTER -lt $NUM_CONTACTS ]; do

    CONTACT=$(( ( RANDOM % $TOTOAL_CONTACTS )  + 1 ))
    CONTACTS[$COUNTER]=$CONTACT

    echo "add"
    sleep 1s
    echo "$CONTACT@$DOMAIN_NAME"
    sleep 1s

    let COUNTER=COUNTER+1
done

# sending messages
COUNTER=0
let TOTAL_MESSAGES=$NUM_CONTACTS*$NUM_MESSAGES
while [ $COUNTER -lt $TOTAL_MESSAGES ]; do

    CONTACT=${CONTACTS[$(( ( RANDOM % $NUM_CONTACTS ) ))]}

    echo "message"
    sleep 1s
    echo "$CONTACT@$DOMAIN_NAME"
    sleep 1s
    echo "hey $CONTACT! this is message #${COUNTER}"
    sleep 5s

    let COUNTER=COUNTER+1
done

# exit
echo "exit"
