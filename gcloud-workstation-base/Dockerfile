# As checked here https://console.cloud.google.com/artifacts/docker/cloud-workstations-images/us-central1/predefined/code-oss
# there is no versionning so I will keep it on latest version
FROM us-central1-docker.pkg.dev/cloud-workstations-images/predefined/code-oss:latest

LABEL name=@strg-at/gcloud-workstation-base
LABEL maintainer=STRG.

# Easy install of flux devenv dependencies, see  https://docs.wakemeops.com/
RUN curl -sSL https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository | sudo bash
RUN apt-get update

#Taskfile
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/bin

#other deps
#   kubectl already installed
#   kubectl \

RUN apt install -y \
  flux \
  kind \
  kustomize \
  pre-commit \
  terraform \
  tflint \
  terraform-docs

RUN apt install -y \
  k9s \
  lens

# git installation
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:git-core/ppa -y && apt-get update
RUN apt install -y git

# go
RUN curl -OL https://golang.org/dl/go1.20.4.linux-amd64.tar.gz && \
  tar -C /usr/local -xvf go1.20.4.linux-amd64.tar.gz && \
  ln -s  /usr/local/go/bin/go  /usr/bin/go
