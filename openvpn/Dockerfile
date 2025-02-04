FROM debian:bookworm-slim@sha256:40b107342c492725bc7aacbe93a49945445191ae364184a6d24fedb28172f6f7

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

ENTRYPOINT ["openvpn", "--user", "nobody", "--config", "/openvpn/server.conf"]
