#!/bin/bash
while true
do
    PID=`pidof beam.smp`
    if [ -z "$PID" ]; then
        continue
    fi

    FDQ=`sudo ls -1 "/proc/${PID}/fd"| wc -l`
    DT=`date`
    echo "$DT   $FDQ"
    sleep 1
done
