FROM mysql:8.4.11@sha256:24989179f58856db763f418010c1169fecc944e3ec1ea7e921572d83eb070f70

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
