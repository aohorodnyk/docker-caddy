FROM scratch

ENV HOME /data

COPY caddy /caddy
VOLUME /data

EXPOSE 80 443

ENTRYPOINT ['/caddy']
