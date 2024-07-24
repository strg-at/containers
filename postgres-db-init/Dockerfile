FROM postgres:15.7@sha256:558f04590f4eff5a19b76bf6758cdbd05b5880a30af26650e4f5b4046ca0864e

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
