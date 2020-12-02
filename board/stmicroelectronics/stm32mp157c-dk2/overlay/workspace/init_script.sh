#! /bin/sh

echo "deingena was here--------------"
ifconfig eth0 up
ifconfig wlan0 up
wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant.conf
echo nameserver 8.8.8.8 > /etc/resolv.conf
echo nameserver 8.8.4.4 >> /etc/resolv.conf
cncjs --allow-remote-access &
