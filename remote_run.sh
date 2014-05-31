#!/bin/bash
for server in "$@"
do
    ssh "$server" "nohup ./whatsup/simulator/run.sh > /dev/null &"
done
