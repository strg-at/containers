FROM debian:bookworm-slim@sha256:ca3372ce30b03a591ec573ea975ad8b0ecaf0eb17a354416741f8001bbcae33d

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

ENTRYPOINT ["openvpn", "--user", "nobody", "--config", "/openvpn/server.conf"]
