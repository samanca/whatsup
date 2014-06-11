#!/bin/bash
mkdir -p log
DATE=`date +%F--%T`
mkdir -p "log/${DATE}"
for server in "$@"
do
    echo $server
    ssh $server "tail output.log"
    scp "${server}:output.log" "log/${DATE}/${server}.log" 
    scp "${server}:error.log" "log/${DATE}/${server}.err"
done
