#
# Dockerfile for OpenVPN
#

FROM alpine:edge

RUN apk add --update \
    openvpn \
    easy-rsa \
    && rm -rf /var/cache/apk/*

# Add directory
RUN mkdir /openvpn-ca
RUN cp -Rp /usr/share/easy-rsa /openvpn-ca
RUN mv /openvpn-ca/easy-rsa/vars.example /openvpn-ca/easy-rsa/vars
RUN cd /openvpn-ca/easy-rsa
RUN ./easyrsa init-pki
RUN (echo raspberry; echo raspberry) | ./easyrsa build-ca nopass
RUN (echo raspberry; echo raspberry) | ./easyrsa gen-req raspberry nopass
RUN (echo yes;) | ./easyrsa sign-req server raspberry
RUN (echo client1;) | ./easyrsa gen-req client1 nopass
RUN (echo yes;) | ./easyrsa sign-req client client1
RUN ./easyrsa gen-crl
RUN mkdir /etc/openvpn/ssl -p
RUN openssl dhparam -out /etc/openvpn/ssl/dh.pem 2048

EXPOSE 1194/udp

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]