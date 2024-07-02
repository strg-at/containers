FROM ghcr.io/actions/actions-runner:2.317.0@sha256:95db6fbb020b9f734e8a00389291dae766f0e6ad3d1171ae2d68e9ad8ac4a985

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      ca-certificates \
      curl \
      file \
      git

USER runner
