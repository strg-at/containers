FROM mysql:8.4.5@sha256:2c828b6640336d7ed411569be4acd6e8acb2711febefcf9ec440ba9fb42c430b

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
