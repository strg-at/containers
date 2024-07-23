FROM mysql:8.4.2@sha256:96709bc0805dde3353089d2439f9dc617440bd2309a6f595bb5af40d65d4918e

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
