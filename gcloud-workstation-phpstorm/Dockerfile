# https://console.cloud.google.com/artifacts/docker/cloud-workstations-images/us-central1/predefined/phpstorm
FROM europe-west3-docker.pkg.dev/cloud-workstations-images/predefined/phpstorm:latest@sha256:9a597a75c39d3e5ab5ad0fc3c28b7faa5ddd508d983b3790d3ab239a2e819a2c AS base

FROM ubuntu:25.04@sha256:27771fb7b40a58237c98e8d3e6b9ecdd9289cec69a857fccfb85ff36294dac20

# we use the /home directory in a persistent way
VOLUME ["/home/"]

# copy necessary folders and files from the official base image
COPY --from=base /google /google
COPY --from=base /etc/workstation-startup.d/ /etc/workstation-startup.d/
COPY --from=base /opt/PhpStorm /opt/PhpStorm
COPY --from=base /usr/bin/workstation-startup /usr/bin/workstation-startup
COPY ./systemd-assets/. /

# install curl, gpg, software-properties-common & wget
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y curl gpg software-properties-common wget

# patch docker scripts to run dockerd directly
RUN sed -i 's/\(^service docker start.*\)/#\1\n\/usr\/bin\/dockerd $DOCKER_OPTS/' /google/scripts/wrapdocker/wrapdocker && \
  sed -i '/^.*wrapdocker.*$/{H;d;}; /service docker restart/{d}; ${G;}' /etc/workstation-startup.d/000_configure-docker.sh

# preparing docker installation
RUN install -m 0755 -d /etc/apt/keyrings \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
  && chmod a+r /etc/apt/keyrings/docker.asc \
  && echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# preparing google sdk installation
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# preparing terraform installation
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | \
  tee /etc/apt/sources.list.d/hashicorp.list

# install repository for devops utilities, see https://docs.wakemeops.com/
RUN curl -sSL https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository | bash

RUN apt update && add-apt-repository ppa:git-core/ppa -y && DEBIAN_FRONTEND=noninteractive apt install -y \
  ack-grep \
  ca-certificates \
  containerd.io \
  direnv \
  docker-buildx-plugin \
  docker-ce \
  docker-ce-cli \
  docker-compose-plugin \
  flux \
  gettext-base \
  git \
  gnupg \
  go-task \
  google-cloud-cli \
  gpg \
  htop \
  k9s \
  kind \
  kubectl \
  kustomize \
  make \
  openssh-client \
  openssh-server \
  openssh-sftp-server \
  openvpn \
  pre-commit \
  software-properties-common \
  sops \
  sudo \
  systemd \
  terraform \
  terraform-docs \
  tflint \
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

# strg scripts
COPY scripts/*.sh /etc/workstation-startup.d/
RUN chmod +x /etc/workstation-startup.d/*.sh

# we keep the original sshd config from the official base image
COPY --from=base /etc/ssh/sshd_config /etc/ssh/sshd_config

# symlink for task binary
RUN ln -s /usr/bin/go-task /usr/bin/task

RUN apt-get clean

ENTRYPOINT ["/usr/bin/workstation-init"]
