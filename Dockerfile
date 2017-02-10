FROM ubuntu:14.04
MAINTAINER Jonathan Como <jonathan.como@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    curl

VOLUME /build
VOLUME /root

CMD ["bash", "/root/build_nginx.sh"]
