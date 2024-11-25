FROM mysql:8.4.3@sha256:106d5197fd8e4892980469ad42eb20f7a336bd81509aae4ee175d852f5cc4565

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
