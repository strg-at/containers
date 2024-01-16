# https://console.cloud.google.com/artifacts/docker/cloud-workstations-images/us-central1/predefined/code-oss
FROM europe-west3-docker.pkg.dev/cloud-workstations-images/predefined/code-oss@sha256:5c9850ee00948ecbbb639cec368598352a9cff3ca7f07380a6c33f50c7d78343

# Easy install of flux devenv dependencies, see  https://docs.wakemeops.com/
RUN curl -sSL https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository | sudo bash
RUN apt update

# base apps
RUN apt install -y \
  direnv \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin \
  golang-go \
  go-task \
  htop \
  openvpn \
  pre-commit \
  software-properties-common \
  sops \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting

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

# openvpn
COPY start-vpn.sh /etc/workstation-startup.d/999_start-vpn.sh
RUN chmod +x /etc/workstation-startup.d/999_start-vpn.sh
RUN ln -s /etc/workstation-startup.d/999_start-vpn.sh /home/user/start-vpn.sh

RUN apt-get clean

EXPOSE 80
