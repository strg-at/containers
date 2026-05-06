FROM mysql:8.4.9@sha256:6e54d72c66fb55fa2bba384cba8c7c0ea9d629fb4d2af613b0eef98d19c6df15

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
