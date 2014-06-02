#!/bin/bash

for server in "$@"
do
    ssh "$server" "sudo reboot" > /dev/null
done
