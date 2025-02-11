FROM mysql:8.4.4@sha256:339598fe066c73daa4120f2d9dfefd3146c3519cd324748e1d3f9d2b6c71d10b

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
