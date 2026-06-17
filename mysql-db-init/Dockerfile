FROM mysql:8.4.10@sha256:563602a18ffd5be220968e8508d84c9dcd80fbffe69e28af51572db29e3285b2

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
