#!/bin/bash
while true
do
    DT=`date`
    OUTPUT=`iostat -dm | awk 'NR==3 || NR==4'`
    echo "$DT"
    echo "$OUTPUT"
    sleep 1
done
