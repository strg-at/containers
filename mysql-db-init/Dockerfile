FROM mysql:8.4.6@sha256:6eb4fba0e8a5f085b0395761bf14e3f6ffae4b864b87eddcbe9474960398202d

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
