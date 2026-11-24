FROM postgres:18.7@sha256:c699303802144847d238196173655dbbecf7a96aeca1565f2b02eb671a1f0b6b

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
