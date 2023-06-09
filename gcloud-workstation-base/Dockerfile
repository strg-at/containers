# As checked here https://console.cloud.google.com/artifacts/docker/cloud-workstations-images/us-central1/predefined/code-oss 
# there is no versionning so I will keep it on latest version
FROM us-central1-docker.pkg.dev/cloud-workstations-images/predefined/code-oss:latest

LABEL name=@strg-at/postgres-db-init
LABEL maintainer=STRG.

# Easy install of flux devenv dependencies, see  https://docs.wakemeops.com/
RUN curl -sSL https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository | sudo bash
RUN apt-get update

#Taskfile
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/bin

#other deps
#   kubectl already installed
#   kubectl \  

RUN apt install \
  flux \
  golang-go \
  kind \
  kustomize \
  pre-commit \
  terraform -y

# RUN apt install \
#   k9s \
#   lens