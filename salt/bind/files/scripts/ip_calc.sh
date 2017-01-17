#!/bin/bash
nodes=$1
group=`echo "(($1 + 253 ) - 1 ) /253 " | bc `
count=0
for i in $(seq 1 $group)
do
start=1
while [ $start -le 254 ]
do 
echo $i.$start 
start=$[$start+1]
count=$[$count+1]
if [ $count -eq $1 ];then
exit 0
fi
done
done
