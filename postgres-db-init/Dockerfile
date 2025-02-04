FROM postgres:15.10@sha256:27e8bdcb234eb5185e586f2ecb2095d0f84a43441dfc266b0eb76332bf3aa299

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
