#!/bin/bash
task_count=20

function task() { 
  sleep 2 && printf "%2d) sleep 2\n" $1
}

date

# 执行并发任务
. ../concurrent.sh
concurrent_init 5
for ((i=0; i<$task_count; i++)); do
  concurrent_run task $i
done
concurrent_wait

date
