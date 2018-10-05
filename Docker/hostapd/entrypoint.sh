#!/bin/bash

# SIGTERM-handler
term_handler() {
  echo "Get SIGTERM"
  iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
  /etc/init.d/dnsmasq stop
  /etc/init.d/hostapd stop
  /etc/init.d/dbus stop
  kill -TERM "$child" 2> /dev/null
}

ifconfig wlan0 10.0.0.1/24

/etc/init.d/dbus start
/etc/init.d/dnsmasq start
/etc/init.d/hostapd start

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT  

# setup handlers
trap term_handler SIGTERM
trap term_handler SIGKILL

sleep infinity &
child=$!
wait "$child"