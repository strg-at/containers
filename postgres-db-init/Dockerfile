FROM postgres:17.5@sha256:378ef4ac725e37399d67444809711e5340f90c2a54b22ab41a52c5ab1cd22d6b

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
