FROM mysql:8.4.4@sha256:0917ecc5863323a48203dda0bb7d58582d958da62914024c474bf2e8c5f5ee73

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
