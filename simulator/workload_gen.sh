#!/bin/bash
USERS_COUNT=$1
AMAZON_INSTANCES=$2

let LOAD_PER_INSTANCE=USERS_COUNT/AMAZON_INSTANCES
COUNTER=1

rm ec2-*

while [ $COUNTER -le $AMAZON_INSTANCES ]; do
    INSTANCE="ec2-$COUNTER"
    let START=(COUNTER-1)*LOAD_PER_INSTANCE+1
    let END=(COUNTER)*LOAD_PER_INSTANCE
    C2=$START
    while [ $C2 -le $END ]; do
        echo "${C2}|root" >> "${INSTANCE}.input"
        let C2=C2+1
    done
    let COUNTER=COUNTER+1
done
