#!/system/bin/sh 
/system/bin/check_1860_state.sh& 
busybox ping -c 1 -w 1800 192.168.41.2 
sleep 5 
while : 
do 
dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 
dji_mb_ctrl -S test -R local -g 9 -s 9 -c 3c 
break 
done 
