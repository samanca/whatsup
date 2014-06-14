#!/bin/bash
COUNTER=1
ORIGIN=0
LINE_NUM=0
while read line
do
    let LINE_NUM=LINE_NUM+1
    #echo $LINE_NUM
    if [ $COUNTER -eq 1 ]
    then
        SIGN=`echo "$line" | awk '{ print $6 }'`
        #echo $SIGN
        if [ $SIGN != "2014" ]
        then
            continue
        fi
        TIME=`date --date="$line" +"%s"`
        #if [ $ORIGIN -eq 0 ]
        #then
        #    ORIGIN=$TIME
        #fi
    fi

    if [ $COUNTER -eq 2 ]
    then
        SIGN=`echo "$line" | awk '{ print $1 }'`
        #echo $SIGN
        if [ "$SIGN" != "PID" ]
        then
           COUNTER=1
           continue
        fi
    fi

    if [ $COUNTER -eq 3 ]
    then
        SIGN=`echo "$line" | awk '{ print $2 }'`
        #echo $SIGN
        if [ "$SIGN" != "root" -a "$SIGN" != "ubuntu" ]
        then
            COUNTER=1
            continue
        fi

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
