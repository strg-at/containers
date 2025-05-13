FROM ghcr.io/actions/actions-runner:2.324.0@sha256:e03b4550955d539604233352ba27cd095a880b906400bb9283f1ee4b061e21bb

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
