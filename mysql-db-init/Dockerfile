FROM mysql:8.4.5@sha256:85144db2a70009020bc161bb11c34064e80e8e951b983c5fe3905ef688b54de8

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
