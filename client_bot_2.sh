#!/bin/bash
NUM_MESSAGES=10
NUM_CONTACTS=10
TOTAL_CONTACTS=100
#DOMAIN_NAME="localhost"
#DOMAIN_NAME="54.200.164.190"
DOMAIN_NAME="132.239.10.209"

RUN_DIR="run"
LOAD_DIR="load"


echo "$1@$DOMAIN_NAME" > "${LOAD_DIR}/${1}.txt"
echo "$1@$DOMAIN_NAME" > "${RUN_DIR}/${1}.txt"
echo "$2" >> "${LOAD_DIR}/${1}.txt"
echo "$2" >> "${RUN_DIR}/${1}.txt"



if [ -n "$3" ]; then
    TOTAL_CONTACTS=$3
fi

if [ $TOTAL_CONTACTS -lt $NUM_CONTACTS ]; then
    NUM_CONTACTS=$TOTAL_CONTACTS
fi

if [ -z "$4" ]; then
    START_AT=1
else
    START_AT="$4"
fi


# remove all existing contacts
echo "remove-all" >> "${LOAD_DIR}/${1}.txt"

# add new contacts
declare -a CONTACTS
COUNTER=0
while [ $COUNTER -lt $NUM_CONTACTS ]; do

    CONTACT=$(( ( RANDOM % $TOTAL_CONTACTS )  + 1 ))
    let CONTACT=CONTACT+START_AT-1

    if [ "$CONTACT" -ne "$1" ]; then
        CONTACTS[$COUNTER]=$CONTACT
        echo "add" >> "${LOAD_DIR}/${1}.txt"
        echo "$CONTACT@$DOMAIN_NAME" >> "${LOAD_DIR}/${1}.txt"
        let COUNTER=COUNTER+1
    fi
done

echo "sleep" >> "${LOAD_DIR}/${1}.txt"
echo "5000" >> "${LOAD_DIR}/${1}.txt"

# sending messages
COUNTER=0
let TOTAL_MESSAGES=$NUM_CONTACTS*$NUM_MESSAGES
while [ $COUNTER -lt $TOTAL_MESSAGES ]; do

    CONTACT=${CONTACTS[$(( ( RANDOM % $NUM_CONTACTS ) ))]}

#
echo $CONTACT
#

    echo "message" >> "${RUN_DIR}/${1}.txt"
    echo "$CONTACT@$DOMAIN_NAME message-number-${COUNTER}-to-client-${CONTACT}-at-${DOMAIN_NAME}-is-sent" >> "${RUN_DIR}/${1}.txt"
    
    echo "sleep" >> "${RUN_DIR}/${1}.txt"
    echo "1000" >> "${RUN_DIR}/${1}.txt"

    let COUNTER=COUNTER+1
done

echo "sleep" >> "${RUN_DIR}/${1}.txt"
echo "5000" >> "${RUN_DIR}/${1}.txt"

# cleanup before exit
echo "remove-all" >> "${RUN_DIR}/${1}.txt"


# exit
echo "exit" >> "${LOAD_DIR}/${1}.txt"
echo "exit" >> "${RUN_DIR}/${1}.txt"
