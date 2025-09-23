FROM mysql:8.4.6@sha256:e69f136d247e6a041599100eee96add480c739d3d9e1815bdccbc60f2b758825

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
