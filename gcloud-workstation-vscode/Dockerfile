# https://console.cloud.google.com/artifacts/docker/cloud-workstations-images/us-central1/predefined/code-oss
FROM europe-west3-docker.pkg.dev/cloud-workstations-images/predefined/code-oss:latest@sha256:a20f623f3cade1e2c9d2415056b792c0797fa39a25064409ea811ad6a6d21537 AS base

FROM ubuntu:24.04@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782

# we use the /home directory in a persistent way
VOLUME ["/home/"]

# copy necessary folders and files from the official base image
COPY --from=base /google /google
COPY --from=base /etc/workstation-startup.d/ /etc/workstation-startup.d/
COPY --from=base /opt/code-oss /opt/code-oss
COPY --from=base /usr/bin/workstation-startup /usr/bin/workstation-startup

# installing pre-requirements
RUN apt update && apt install -y \
  ca-certificates gpg sudo curl

# preparing gsutil installation
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# preparing docker installation
RUN install -m 0755 -d /etc/apt/keyrings \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
  && chmod a+r /etc/apt/keyrings/docker.asc \
  && echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# easy install of flux devenv dependencies, see  https://docs.wakemeops.com/
RUN curl -sSL https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository | sudo bash

# base apps
RUN apt update && apt install -y \
  ack-grep \
  ca-certificates \
  direnv \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin \
  gettext-base \
  google-cloud-cli \
  go-task \
  gpg \
  htop \
  make \
  openvpn \
  openssh-client \
  openssh-server \
  openssh-sftp-server \
  pre-commit \
  ruby \
  ruby-dev \
  software-properties-common \
  sops \
  tig \
  vim \
  yq \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting

# install latest go-lang stable
RUN export latest=$(curl -s "https://go.dev/VERSION?m=text" | head -n 1) && wget https://go.dev/dl/$latest.linux-amd64.tar.gz && tar -C /usr/local -xzf $latest.linux-amd64.tar.gz && ln -s /usr/local/go/bin/go /usr/bin/go

# install latest stable version from github, install it in /usr/local/bin due to PATH precedence
RUN curl -Lo envsubst https://github.com/a8m/envsubst/releases/latest/download/envsubst-Linux-x86_64 \
    && chmod +x envsubst \
    && mv envsubst /usr/local/bin/

# infra
RUN apt install -y \
  flux \
  kind \
  kubectl \
  kustomize \
  k9s \
  terraform \
  terraform-docs \
  tflint

# git
RUN add-apt-repository ppa:git-core/ppa -y && apt update && apt install -y git

# strg scripts
COPY scripts/*.sh /etc/workstation-startup.d/
RUN chmod +x /etc/workstation-startup.d/*.sh

# containerd configuration
COPY containerd.toml /etc/containerd/config.toml

# openvpn
RUN ln -s /etc/workstation-startup.d/999_start-vpn.sh /usr/local/bin/start-vpn

# we keep the original sshd config from the official base image
COPY --from=base /etc/ssh/sshd_config /etc/ssh/sshd_config

# symlink for task binary
RUN ln -s /usr/bin/go-task /usr/bin/task

RUN apt-get clean

# set Code OSS port to 81
RUN sed -i 's/80/8084/' /etc/workstation-startup.d/110_start-code-oss.sh

EXPOSE 8084

ENTRYPOINT [ "/google/scripts/entrypoint.sh" ]
