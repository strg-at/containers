FROM postgres:15.10@sha256:6cbdd616ae7ea61fa88873fdab529b3fd141b8a8311bfe4e6e62575f643f88fe

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
