FROM debian:bookworm-slim@sha256:537bb7422b661ed483951dd9a0a5ce735076cf86217a2b32c4ad3e8d993850a0

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

ENTRYPOINT ["openvpn", "--user", "nobody", "--config", "/openvpn/server.conf"]
