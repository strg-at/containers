FROM postgres:17.6@sha256:243a1ae1d1ef200ee0526618cbbab370c306a4046fb6a977061147dbaa292b9c

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
