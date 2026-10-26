FROM ghcr.io/actions/actions-runner:2.338.2@sha256:759a1d94a15b05941aba5196974ff43fe15b4cbba29b694b35cbc32a1166b232

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
