#!/bin/bash

git pull origin dev

count=`ps -ef|grep 'python cps.py'|grep -v 'grep'|wc -l`
echo $count
if [ $count -gt 0 ];then
    echo 'calibre-web is running!Ready to kill it'
    id=`ps -ef|grep python|grep 'python cps.py'|grep -v 'grep'|awk '{print $2}'`
    kill $id
fi
nohup python cps.py >/dev/null 2>&1 &
echo 'start calibre-web success!'

