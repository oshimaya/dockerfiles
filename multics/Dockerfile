#
FROM debian

MAINTAINER oshima 

RUN mkdir -p /emu /multics
ADD http://swenson.org/multics_wiki/downloads/linux64/dps8 /emu/
ADD startup.sh /emu/
RUN chmod +x /emu/*

EXPOSE 6180
VOLUME /multics

ENTRYPOINT ["/emu/startup.sh"]
CMD ["usage"]
