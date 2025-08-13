FROM debian:bookworm-slim@sha256:8f8e63bb364a33694362f38ee9a9e38b09eb9eb138584693800b87ca173bfd4a

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

ENTRYPOINT ["openvpn", "--user", "nobody", "--config", "/openvpn/server.conf"]
