FROM debian:bookworm-slim

# renovate: depName=openvpn
ENV OPENVPN_VERSION="2.6.3-1+deb12u2"

RUN apt update && apt install -y \
    curl \
    openvpn="${OPENVPN_VERSION}" && \
    apt clean

COPY openvpn.sh /usr/local/bin/
ENTRYPOINT ["bash", "/usr/local/bin/openvpn.sh"]
