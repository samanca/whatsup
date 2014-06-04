#!/bin/bash
while true
do
    PKTQ=`sudo netstat --tcp -p | grep xmpp-client | awk '{print $(2)}' | paste -sd+ | bc`
    DT=`date`
    echo "$DT   $PKTQ"
    sleep 1
done
