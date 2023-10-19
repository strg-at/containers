# https://console.cloud.google.com/artifacts/docker/cloud-workstations-images/us-central1/predefined/code-oss
FROM europe-west3-docker.pkg.dev/cloud-workstations-images/predefined/code-oss@sha256:5c9850ee00948ecbbb639cec368598352a9cff3ca7f07380a6c33f50c7d78343

RUN curl -L https://nixos.org/nix/install --daemon | sudo bash

# Easy install of flux devenv dependencies, see  https://docs.wakemeops.com/
RUN curl -sSL https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository | sudo bash
RUN apt-get update

# base apps
RUN apt install -y \
  direnv \
  git \
  golang-go \
  go-task \
  pre-commit \
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

RUN apt-get clean

EXPOSE 80
