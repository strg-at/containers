FROM ghcr.io/actions/actions-runner:2.333.1@sha256:b57864c9fcda15ea4a270446aa9cfb108b819a26f6e71fc515f6caf6c27989c6

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
