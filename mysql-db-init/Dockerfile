FROM mysql:9.0.0@sha256:72a37ddc9f839cfd84f1f6815fb31ba26f37f4c200b90e49607797480e3be446

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
