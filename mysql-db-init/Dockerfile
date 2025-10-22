FROM mysql:8.4.7@sha256:b306273d4d36bc1a7f265130c3dd93c0462253af7634203e569add0403a7b273

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
