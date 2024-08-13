FROM ghcr.io/actions/actions-runner:2.319.0@sha256:3bee2ec62f586beb76013d462df84d3dafc7dff94fe4ac731bcf3157c3a324f3

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      ca-certificates \
      curl \
      file \
      git

USER runner
