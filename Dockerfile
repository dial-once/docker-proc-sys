FROM alpine
MAINTAINER jmuller@dial-once.com

RUN apk update && apk upgrade && \
    apk add --no-cache bash

ADD run.sh /
ENV KEEPALIVE **None**
ENV DEFRAG **None**
VOLUME /data
CMD ["/run.sh"]
