FROM alpine
MAINTAINER jmuller@dial-once.com

RUN apk update && apk upgrade && \
    apk add --no-cache bash

ADD run.sh /
ENV KEEPALIVE NOPE
ENV HUGEPAGE NOPE

VOLUME /data/proc
VOLUME /data/etc

ADD scripts /scripts

CMD ["/run.sh"]
