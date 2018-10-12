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

# Add Linux user
RUN adduser -D -g '' pi

# Add Smb user
RUN (echo raspberry; echo raspberry) | smbpasswd -s -a pi

# Add config file
ADD smb.conf /etc/samba/smb.conf

EXPOSE 445/tcp 139/tcp 137/udp 138/udp

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]