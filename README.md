# concurrent
bash shell 多任务并发库

## 方法说明
- concurrent_init
  - 初始化并发，可传入参数控制并发量，默认 5，取值范围 (0,`ulimit -u`)
- concurrent_run
  - 执行任务
- concurrent_wait
  - 等待所有任务完成

## 使用
```shell
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
```

## 示例
![demo](https://github.com/goindow/concurrent/blob/main/example/demo.png)
