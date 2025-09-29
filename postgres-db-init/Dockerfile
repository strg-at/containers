FROM postgres:18.0@sha256:1d288494853e244e7a78d87b3526e650e5221c622f9768ecac9313d0874a9c39

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
