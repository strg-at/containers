FROM ghcr.io/actions/actions-runner:2.333.0@sha256:1ad983536759ceec39ed75a2c8f007ca8c37b66eee35ed86f13623b29a4db97d

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
