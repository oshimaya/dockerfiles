#
FROM ubuntu:16.04

MAINTAINER oshima <oshima-ya@yagoto-urayama.jp>
RUN apt-get update -y
RUN apt-get install -y gcc make libdb-dev libgmp-dev
RUN apt-get install -y patch curl

RUN mkdir -p /files /work
WORKDIR /work

VOLUME /files
VOLUME /work
ADD build.sh  /root/
COPY patches  /files/patches
ENTRYPOINT ["/root/build.sh"]
CMD ["shell"]
