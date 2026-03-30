FROM debian:bookworm-slim@sha256:f06537653ac770703bc45b4b113475bd402f451e85223f0f2837acbf89ab020a

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

ENTRYPOINT ["openvpn", "--user", "nobody", "--config", "/openvpn/server.conf"]
