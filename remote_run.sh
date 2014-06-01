#!/bin/bash

# git pull + compile
for server in "$@"
do
    ssh "$server" "cd /home/ubuntu/whatsup && git pull" > /dev/null
    ssh "$server" "cd /home/ubuntu/whatsup/simulator && ant" > /dev/null
done

# run clients
for server in "$@"
do
    ssh "$server" "nohup ./whatsup/simulator/run.sh /home/ubuntu/whatsup/simulator/${server}.input 1>output.log 2>error.log &"
done
