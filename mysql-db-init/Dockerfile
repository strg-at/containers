FROM mysql:8.4.7@sha256:1f5b0aca09cfa06d9a7b89b28d349c1e01ba0d31339a4786fbcb3d5927070130

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
