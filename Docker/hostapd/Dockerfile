FROM raspbian/stretch

MAINTAINER Arjan van Schoonhoven "arjan.van.schoonhoven@gmail.com"

RUN apt-get update --fix-missing && apt-get install -y \
    hostapd \
    dbus \
    net-tools \
    iptables \
    dnsmasq \
    vim \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD hostapd.conf /etc/hostapd/hostapd.conf
ADD hostapd /etc/default/hostapd
ADD dnsmasq.conf /etc/dnsmasq.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]