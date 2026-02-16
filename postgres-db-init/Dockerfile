FROM postgres:17.8@sha256:1eada89ec2521ae0f61125f6bdaf83bbbf88a43fecda48d112a83bb92df75c36

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
