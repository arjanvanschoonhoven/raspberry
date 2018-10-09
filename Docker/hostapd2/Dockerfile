FROM alpine:latest
MAINTAINER Arjan van Schoonhoven <arjan.van.schoonhoven@gmail.com>

# install hostapd, bash, dbus, net-tools iptables dnsmasq
RUN apk --no-cache add hostapd bash net-tools iptables dnsmasq

ADD hostapd.conf /etc/hostapd/hostapd.conf
ADD hostapd /etc/default/hostapd
ADD dnsmasq.conf /etc/dnsmasq.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]