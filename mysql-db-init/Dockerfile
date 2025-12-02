FROM mysql:8.4.7@sha256:ab61c921d5f5f6da7f62580a81b03eacbf0ad328850c4fa523850bcedad527f8

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
