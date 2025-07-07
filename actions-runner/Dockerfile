FROM ghcr.io/actions/actions-runner:2.326.0@sha256:9c3383600872325f21951a0a1a8ae640361ff5e1abdf1f2900de8ba1cfd915e9

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
