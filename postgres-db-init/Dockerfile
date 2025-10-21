FROM postgres:17.6@sha256:603395c235c99984271a59a6476eed9db4f584e85ba64f9f49a65ba835882f33

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
