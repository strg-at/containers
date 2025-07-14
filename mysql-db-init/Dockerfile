FROM mysql:8.4.5@sha256:32cdfd01c2996419a2ff4ced7234c06af60a63e714e182e3cc5966182b67034c

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
