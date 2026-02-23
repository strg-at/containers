FROM mysql:8.4.8@sha256:a2d126916bc2ba79a890a4bf62d305eb8b68fcbdd35c6e582d529df18faf5ebb

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
