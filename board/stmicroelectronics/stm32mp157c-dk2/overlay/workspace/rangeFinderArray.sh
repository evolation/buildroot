#!/bin/sh
echo " Range finder Started" > /dev/kmsg

while true; do
        DATE=`date +%Y%m%d`
        HOUR=`date +%H%M%S`
#        echo $DATE $HOUR> /dev/kmsg
#       i2cset -y 2 0x70 0 0x60
        i2cset -y 2 0x70 0 0x51
        sleep 1
        low=`i2cget -y 2 0x70 3`
        high=`i2cget -y 2 0x70 4`
        dis=$(( 256*$high + $low ))
        echo $DATE $HOUR     $dis cm> /dev/kmsg
done
