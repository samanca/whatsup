#!/bin/bash
COUNTER=1
ORIGIN=0
while read line
do
    if [ $COUNTER -eq 1 ]
    then
        TIME=`date --date="$line" +"%s"`
        #if [ $ORIGIN -eq 0 ]
        #then
        #    ORIGIN=$TIME
        #fi
    fi

    if [ $COUNTER -eq 3 ]
    then
        CPU=`echo "$line" | awk '{ print $9 }'`
        MEMORY=`echo "$line" | awk '{ print $10 }'`

        #let diff=TIME-ORIGIN
        #echo -e "$diff\t$CPU"
        echo -e "$TIME\t$CPU\t$MEMORY"
    fi

    let COUNTER=COUNTER+1
    if [ $COUNTER -eq 4 ]
    then
        COUNTER=1
    fi
done < $1
