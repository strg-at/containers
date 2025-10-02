FROM postgres:17.6@sha256:e6a4209d1a4893f2df3bdcde58f8926c3c929c4d51df90990ed1b36d83c1382a

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
