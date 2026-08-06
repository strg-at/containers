FROM debian:bookworm-slim@sha256:abd67ffcfa541b485a3dff59865ab629aa048a6c613e639d36e7456b0b229241

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

ENTRYPOINT ["openvpn", "--user", "nobody", "--config", "/openvpn/server.conf"]
