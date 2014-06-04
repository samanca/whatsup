#!/bin/bash
while true
do
    DT=`date`
    OUTPUT=`vmstat -s`
    echo "$DT"
    echo "$OUTPUT"
    sleep 1
done
