FROM scratch

ENV HOME /data

COPY caddy /caddy
VOLUME /data /etc /logs

EXPOSE 80 443

ENTRYPOINT ['/caddy']
CMD ["--conf", "/etc/Caddyfile"]
