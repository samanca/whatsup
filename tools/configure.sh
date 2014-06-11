#!/bin/bash
TYPE="xlarge_8"
DEST_PATH="~/openfire_src/target/openfire/plugins/hazelcast/classes"
for SERVER in "$@"
do
	ssh "$SERVER" "cd ~/whatsup && git pull && cp server/configs/openfire/${TYPE}/hazelcast-cache-config.xml ${DEST_PATH}"
done
