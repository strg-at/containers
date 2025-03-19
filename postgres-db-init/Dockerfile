FROM postgres:15.12@sha256:9e9298817d19f4bd60c5028a25762b394db37dda173dd3d035a1bc155542051a

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
