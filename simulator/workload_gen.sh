#!/bin/bash
START=$1
END=$2

COUNTER=$START
while [ $COUNTER -le $END ]; do
    echo "${COUNTER}|root"
    let COUNTER=COUNTER+1
done
