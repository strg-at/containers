FROM postgres:15.12@sha256:d5f1596ddc41fd01ba0063b798c95431f8468aea4c04b4140f2574e85a631627

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
