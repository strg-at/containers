FROM postgres:17.7@sha256:ecebd237d9aaf83112427807848bc41ba6bd4df8a2f6936e09f7db1813609625

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
