FROM ghcr.io/actions/actions-runner:2.325.0@sha256:deb54a88ead0a86beedec6ac949e8b28f77478835b9c6434ccc237390a6e3e4f

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
