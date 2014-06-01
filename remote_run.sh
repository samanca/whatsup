#!/bin/bash
for server in "$@"
do
    ssh "$server" "nohup ./whatsup/simulator/run.sh /home/ubuntu/whatsup/simulator/${server}.input 1>output.log 2>error.log &"
done
