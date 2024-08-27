FROM debian:bookworm

RUN mkdir -p /etc/apt/keyrings && curl -fsSL https://packages.openvpn.net/packages-repo.gpg | tee /etc/apt/keyrings/openvpn.asc

RUN echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian \
    bookworm main"| tee /etc/apt/sources.list.d/openvpn-packages.list

RUN apt update && apt install -y \
    curl \
    openvpn

COPY openvpn.sh /usr/local/bin/
ENTRYPOINT ["bash", "/usr/local/bin/openvpn.sh"]