FROM ghcr.io/actions/actions-runner:2.318.0@sha256:b05be064f0b30ac9d1ec0526f9429f7df2da45379b0cf50f1fda97793e1bd416

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      ca-certificates \
      curl \
      file \
      git

USER runner
