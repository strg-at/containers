FROM postgres:17.10@sha256:39fb82e41109483c81ac15422a302500b4a753777b47f8431038703536bc6c52

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
