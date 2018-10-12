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
RUN ./openvpn-ca/easy-rsa/easyrsa init-pki
RUN (echo raspberry; echo raspberry) | ./openvpn-ca/easy-rsa/easyrsa build-ca nopass
RUN (echo raspberry; echo raspberry) | ./openvpn-ca/easy-rsa/easyrsa gen-req raspberry nopass
RUN (echo yes;) | ./openvpn-ca/easy-rsa/easyrsa sign-req server raspberry
RUN (echo client1;) | ./openvpn-ca/easy-rsa/easyrsa gen-req client1 nopass
RUN (echo yes;) | ./openvpn-ca/easy-rsa/easyrsa sign-req client client1
RUN ./openvpn-ca/easy-rsa/easyrsa gen-crl
RUN mkdir /etc/openvpn/ssl -p
RUN openssl dhparam -out /etc/openvpn/ssl/dh.pem 2048
RUN openvpn --genkey --secret /etc/openvpn/ssl/ta.key

EXPOSE 1194/udp

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]