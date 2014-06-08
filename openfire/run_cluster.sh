#!/bin/bash
for SERVER in "$@"
do
	ssh -f "$SERVER" "nohup /home/ubuntu/openfire_src/target/openfire/bin/openfire.sh &"
done
