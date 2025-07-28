FROM ghcr.io/actions/actions-runner:2.327.1@sha256:551dc313e6b6ef1ca7b9594d8090a7a6cc7aeb663f1079ba2fec07e9158f3259

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
