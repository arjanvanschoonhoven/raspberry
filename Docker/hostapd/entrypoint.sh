#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT  

/usr/sbin/

/etc/init.d/dbus start
/etc/init.d/dnsmasq start

# setup handlers
trap term_handler SIGTERM
trap term_handler SIGKILL

/etc/init.d/hostapd start

sleep infinity &
child=$!
wait "$child"