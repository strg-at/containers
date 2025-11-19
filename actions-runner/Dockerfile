FROM ghcr.io/actions/actions-runner:2.330.0@sha256:25e5339f41c8511899dff6d9d1ee3d29d0aaca085f24b967f486e153e4368cc6

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      file \
      git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER runner
