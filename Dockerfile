FROM scratch

ADD caddy /caddy

VOLUME /var/log/lego
VOLUME /etc

ENTRYPOINT ['/caddy']
CMD ["--conf", "/etc/Caddyfile"]
