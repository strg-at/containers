FROM postgres:15.10@sha256:a35b3c0190dac5a82ec1778b34cb4963bdd9d161f80381a6297be6e2c3c13a7c

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
