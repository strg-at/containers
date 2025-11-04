FROM debian:bookworm-slim@sha256:4d9b5b6cf5f643fdf2887eab79f2f916363704184ab270bf4a5c1d65102d03d2

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

ENTRYPOINT ["openvpn", "--user", "nobody", "--config", "/openvpn/server.conf"]
