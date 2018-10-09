#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT  

service dnsmasq start
service hostapd start
 
rc-update add iptables
rc-update add dnsmasq
rc-update add hostapd

sleep infinity &
child=$!
wait "$child"