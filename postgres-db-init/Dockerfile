FROM postgres:15.9@sha256:4aea4ddff8a3b411d6644e2cec3748c365189de1a2ffd5a7ac579dfbe45845a0

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
