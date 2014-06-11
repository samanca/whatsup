#!/bin/bash
ACC_TIME=0
ACC_VALUE=0
COUNTER=1
SAMPLE_RATE=5
TIME_SCALE=0
VALUE_SCALE=3
while read line
do
    TIME=`echo $line | awk '{ print $1 }'`
    VALUE=`echo $line | awk '{ print $2 }'`
    
    let ACC_TIME=ACC_TIME+TIME
    ACC_VALUE=`echo "$ACC_VALUE + $VALUE" | bc -l`

    if [ $COUNTER -eq $SAMPLE_RATE ]
    then
        let AVG_TIME=ACC_TIME/SAMPLE_RATE
        AVG_VALUE=`echo "scale=$VALUE_SCALE; $ACC_VALUE / $SAMPLE_RATE" | bc -l`
        echo -e "${AVG_TIME}\t${AVG_VALUE}"
        COUNTER=0
        ACC_TIME=0
        ACC_VALUE=0
    fi

    let COUNTER=COUNTER+1
done < $1
