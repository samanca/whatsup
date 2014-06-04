#!/bin/bash
./fd_q.sh >> ./logs/fd_q.log &
./../shared/tcp_q.sh >> ./logs/tcp_q.log &
./thread_q.sh >> ./logs/thread_q.log &
./cpumem_util.sh >> ./logs/cpumem_util.log &
./../shared/disk_util.sh >> ./logs/disk_util.log &
./../shared/vmstat.sh >> ./logs/vmstat.log &
