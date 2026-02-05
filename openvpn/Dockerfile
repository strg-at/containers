FROM debian:bookworm-slim@sha256:98f4b71de414932439ac6ac690d7060df1f27161073c5036a7553723881bffbe

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

ENTRYPOINT ["openvpn", "--user", "nobody", "--config", "/openvpn/server.conf"]
