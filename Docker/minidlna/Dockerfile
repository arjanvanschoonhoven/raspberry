FROM arch-armv7hf-base

MAINTAINER Arjan van Schoonhoven "arjan.van.schoonhoven@gmail.com"

RUN apt-get update --fix-missing && apt-get install -y \
    minidlna \
    bash \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD minidlna.conf /etc/minidlna.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]