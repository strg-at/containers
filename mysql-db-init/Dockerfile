FROM mysql:8.4.6@sha256:6e60ad6d61d8e7f0a4fd07f6b14109331d66a2f0d089e4b7a1f485d671a29604

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
