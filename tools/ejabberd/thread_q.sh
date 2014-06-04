#!/bin/bash
while true
do
    PID=`pidof beam.smp`
    if [ -z "$PID" ]; then
        continue
    fi
    PKTQ=`ps -eLo pid,cmd,nlwp | grep "${PID}" | awk '{print $(3)}' | paste -sd+ | bc`
    DT=`date`
    echo "$DT   $PKTQ"
    sleep 1
done
