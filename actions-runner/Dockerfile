FROM ghcr.io/actions/actions-runner:2.332.0@sha256:8c3f5970b8ceb90cbd3e89b80c6806bb74d9c31686e9177c743323a4539d12f5

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
