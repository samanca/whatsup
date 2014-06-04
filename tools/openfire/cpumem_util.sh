#!/bin/bash
while true
do
    PID=`pidof java`
    if [ -z "$PID" ]; then
        continue
    fi
    DT=`date`
    OUTPUT=`top -p "$PID" -b -n 1 | awk 'NR==7||NR==8'`
    echo "$DT"
    echo "$OUTPUT"
    sleep 1
done
