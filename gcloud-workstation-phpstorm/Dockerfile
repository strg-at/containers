# https://console.cloud.google.com/artifacts/docker/cloud-workstations-images/us-central1/predefined/phpstorm
FROM europe-west3-docker.pkg.dev/cloud-workstations-images/predefined/phpstorm@sha256:f07f5738e4ea75ee06e81163c1ae38d043f9027d75e25834cf4a534da2332e21

# Easy install of flux devenv dependencies, see  https://docs.wakemeops.com/
RUN curl -sSL https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository | sudo bash
RUN apt-get update

# base apps
RUN apt install -y \
  direnv \
  git \
  golang-go \
  go-task \
  pre-commit

# infra
RUN apt install -y \
  flux \
  kind \
  kubectl \
  kustomize \
  k9s \
  lens \
  terraform \
  terraform-docs \
  tflint

RUN apt-get clean
