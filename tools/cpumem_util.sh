#!/bin/bash
while true
do
    PID=`pidof beam.smp`
    if [ -z "$PID" ]; then
        continue
    fi
    DT=`date`
    OUTPUT=`ps -p "$PID" -o %cpu,%mem`
    echo "$DT   $OUTPUT"
    sleep 1
done
