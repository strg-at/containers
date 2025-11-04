FROM postgres:17.6@sha256:5b5b35a7f494e5f12b94df7e1c6fdfaaceb32230eb04b6214a8aedf2bab57010

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
