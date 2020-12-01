#! /bin/sh

echo "deingena was here--------------"
ifconfig eth0 up
ifconfig wlan0 up
wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant.conf

