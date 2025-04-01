FROM mysql:8.4.4@sha256:23818b7d7de427096ab1427b2e3d9d5e14a5b933f9a4431a482d6414bc879091

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
