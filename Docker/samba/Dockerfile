#
# Dockerfile for samba (without netbios)
#

FROM alpine:edge

RUN apk add --update \
    samba-common-tools \
    samba-client \
    samba-server \
    shadow \
    && rm -rf /var/cache/apk/*

EXPOSE 445/tcp 139/tcp 137/udp 138/udp

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]