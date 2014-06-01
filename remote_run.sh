#!/bin/bash

# git pull
for server in "$@"
do
    ssh "$server" "cd /home/ubuntu/whatsup && git pull"
done

# run clients
#for server in "$@"
#do
#    ssh "$server" "nohup ./whatsup/simulator/run.sh /home/ubuntu/whatsup/simulator/${server}.input 1>output.log 2>error.log &"
#done
