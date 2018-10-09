#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT  

echo "Starting DNSMASQ daemon ..."
/usr/sbin/dnsmasq
# Capture external docker signals
trap 'true' SIGINT
trap 'true' SIGTERM
trap 'true' SIGHUP

echo "Starting HostAP daemon ..."
/usr/sbin/hostapd /etc/hostapd/hostapd.conf

sleep infinity &
child=$!
wait "$child"