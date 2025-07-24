FROM mysql:8.4.6@sha256:d2c60b1b225c6d7845f0abdb596fc35c2d4122bcad6ec219588035a118f75d93

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
