#!/bin/bash

start_time=`date +%s`
[ -e /work/file1 ] || mkfifo /work/file1
exec 3<>/work/file1
rm -rf /work/file1
for ((j=1;j<=10;j++))
do
  echo >&3
done

for i in {1..100}
do
{
sleep 1
echo "$i is successful"
echo >&3
}&
done

wait
stop_time=`date +%s`  #定义脚本运行的结束时间

echo "TIME:`expr $stop_time - $start_time`"
exec 3>&-
exec 3<&-
