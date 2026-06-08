FROM ghcr.io/actions/actions-runner:2.335.0@sha256:ccdcb5f6ad3ff02cda20d47544b9bc335b9d555b535fb3556da83e823652a8b4

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      gettext-base \
      file \
      git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER runner
