FROM alpine:latest
MAINTAINER Arjan van Schoonhoven <arjan.van.schoonhoven@gmail.com>

RUN apk update && apk upgrade && apk add bash samba-common-tools samba && rm -rf /var/cache/apk/*

ADD smb.conf /etc/samba/smb.conf

EXPOSE 445 137 138 139

RUN chmod 777 /etc/samba/smb.conf

ENTRYPOINT ["smbd", "--foreground", "--log-stdout", "-s" "/etc/samba/smb.conf"]
CMD []