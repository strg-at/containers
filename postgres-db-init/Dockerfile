FROM postgres:17.5@sha256:30a72339ce74f2621f0f82cd983a11ade307ec2e634a7998318e8813a6f6f25c

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
