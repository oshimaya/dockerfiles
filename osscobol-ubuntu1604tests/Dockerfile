#
FROM ubuntu:16.04

MAINTAINER oshima <oshima-ya@yagoto-urayama.jp>
RUN apt-get update -y
RUN apt-get install -y gcc make libdb-dev libgmp-dev

RUN mkdir -p /files /work
WORKDIR /work

ADD https://github.com/opensourcecobol/opensource-cobol/archive/v1.5.0J-utf8.tar.gz /files/opensource-cobol-v1.5.0J-utf8.tar.gz
VOLUME /files
VOLUME /work
ADD build.sh  /work/
ENTRYPOINT ["/work/build.sh"]
CMD ["shell"]
