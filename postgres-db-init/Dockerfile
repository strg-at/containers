FROM postgres:17.7@sha256:a1b54ad4d1781324a01774df9dc654e99c8ba4f693587a7af0a3c01affe20e5b

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
