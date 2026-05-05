FROM mysql:8.4.9@sha256:21d5c55b7f74a97dcbd281dfbb10356a16b1199da956a63b55493418afe2b940

LABEL name=@strg-at/mysql-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
