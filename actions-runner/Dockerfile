FROM ghcr.io/actions/actions-runner:2.322.0@sha256:c02e8e1b479ea39b196c3bb0a40a66a191302654a6ef5c042eafe11c13323137

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
