FROM scratch

ADD caddy /caddy

VOLUME /var/lego

ENTRYPOINT ['/caddy']