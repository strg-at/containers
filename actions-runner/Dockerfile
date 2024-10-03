FROM ghcr.io/actions/actions-runner:2.320.0@sha256:8de989a63c2dad8aeb7c44b70f86189d148f887cbd917ecbe83879df54bf6590

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      ca-certificates \
      curl \
      file \
      git

USER runner
