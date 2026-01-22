FROM mysql:8.4.8@sha256:cf6d1c8f2d31c73c878c6f5f60c2bec46701c41d5baf99100888bef5b6578b86

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
