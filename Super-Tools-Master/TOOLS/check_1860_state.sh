#!/system/bin/sh 
/system/bin/check_1860_state.sh& 
busybox ping -c 1 -w 1800 192.168.41.2 
sleep 5 
while : 
do 
break 
done 
