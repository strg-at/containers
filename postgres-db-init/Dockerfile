FROM postgres:17.5@sha256:3962158596daaef3682838cc8eb0e719ad1ce520f88e34596ce8d5de1b6330a1

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
