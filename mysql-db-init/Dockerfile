FROM mysql:8.4.8@sha256:669b2d89f3916f5263af230ffa20889a03c7f4bedf58133fe8780466c613f7ae

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
