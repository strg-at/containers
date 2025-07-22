FROM ghcr.io/actions/actions-runner:2.327.0@sha256:224357e7a67672ca0f7c48c2c5a4e576950bdeff15c06fb3a8313104160a79fa

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
