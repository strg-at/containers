FROM postgres:15.12@sha256:b40600c8627e6869c19a2c7d1aa436ae74df88b993ed2caa7e3f4b6bfcbe5013

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
