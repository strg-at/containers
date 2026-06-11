FROM postgres:17.10@sha256:ef92240eff6b0bcce8ccf038c2edcd0d8fd8ef90621849993b8c8995881ab09a

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
