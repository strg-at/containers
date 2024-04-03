FROM ghcr.io/actions/actions-runner:2.315.0

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      ca-certificates \
      curl \
      file \
      git

USER runner
