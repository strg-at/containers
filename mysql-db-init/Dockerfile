FROM mysql:8.4.5@sha256:9d43fc79508d3d3341221a8ec281835f848821d596022b286474ff810974513b

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
