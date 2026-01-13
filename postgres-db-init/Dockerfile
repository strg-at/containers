FROM postgres:17.7@sha256:4ad49a4ba70130eab1de69bdd7a212d9c711e7410f10e1a23aae41a325b95093

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
