#!/bin/bash
for server in "$@"
do
    ssh "$server" "nohup ./home/ubuntu/simulator/run.sh /home/ubuntu/simulator/${server}.input 1>output.log 2>error.log &"
done
