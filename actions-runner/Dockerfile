FROM ghcr.io/actions/actions-runner:2.321.0@sha256:27f3f74ec6f88026491d761270525ccf630a53ce9cd5db1d5f44cd2470abe380

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      ca-certificates \
      curl \
      file \
      git

USER runner
