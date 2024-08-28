FROM debian:latest

RUN apt update && apt install -y \
    curl \
    openvpn

COPY openvpn.sh /usr/local/bin/
ENTRYPOINT ["bash", "/usr/local/bin/openvpn.sh"]
