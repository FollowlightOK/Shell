#!/bin/sh
startDate="20220831"
endDate="20221026"
echo "起始日期：$startDate"
echo "结束日期：$endDate"
#将日期转成秒
startDateTime=`date -d "$startDate" +%s`
endDateTime=`date -d "$endDate" +%s`
#两个日期秒数差
diff=`expr $endDateTime - $startDateTime`
#计算天数（一天246060=86400秒）
diffCount=$(expr $diff/86400)
echo "两个日期相差天数(表达式)：$diffCount"
echo "两个日期相差天数(整数)：$[diffCount]"
echo "输出两个日期之间的所有日期："
#利用相差的天数输出两个日期之间所有日期
for((i=0;i<=$[diffCount];i++))
do
currentDate=`date -d "$startDate $i day" +%Y%m%d`
echo $currentDate
done

