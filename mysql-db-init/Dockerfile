FROM mysql:8.4.5@sha256:2764fe573c51062d1eadd39a78cc60aa85359bffec2451b7a9660f531bcfb53e

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
