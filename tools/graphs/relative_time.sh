#!/bin/bash
REFERENCE=0
while read line
do
    TIME=`echo "$line" | awk '{ print $1 }'`
    DATA=`echo "$line" | awk '{ print $2 }'`

    if [ $REFERENCE -eq 0 ]
    then
        REFERENCE=$TIME
    fi

    let DIFF=TIME-REFERENCE
    echo -e "$DIFF\t$DATA"
done < $1
