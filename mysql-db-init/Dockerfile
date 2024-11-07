FROM mysql:8.4.3@sha256:6bc3ac72e858ad6ecb651229520fe14848b885ed01b3f08e2b201a25a5f49476

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
