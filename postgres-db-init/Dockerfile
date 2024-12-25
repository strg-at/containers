FROM postgres:15.10@sha256:06dd85a64e950719a3ee8435ce1bdc32b5f8acf406185d7ff875bcced5817165

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
