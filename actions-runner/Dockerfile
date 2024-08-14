FROM ghcr.io/actions/actions-runner:2.319.1@sha256:30a523019a27c97da3f2145252dad9478b7427a8b484a0c775f3a8605d84d35d

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      ca-certificates \
      curl \
      file \
      git

USER runner
