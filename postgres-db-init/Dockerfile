FROM postgres:17.6@sha256:14d1abe0b1c660ec3c7521786d1249157699ebc62b07ea84ab6aad5239f5251f

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
