FROM mysql:8.4.8@sha256:c4678fed620278d29a6ef031b6aba9a31b1bc8f48e46bd56e9706943db2bc0c1

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
