FROM postgres:17.5@sha256:8e0059697e15b2067733fe2e3d95df33dc17d639bdd887a9881483b4222c3933

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
