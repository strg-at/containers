FROM docker.io/jenkins/jenkins:2.462.2-jdk17 AS jenkins
USER root

# install base packages
RUN apt update && apt install rsync wget -y

# install helm 3
RUN wget https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get-helm-3 &&\
    ./get-helm-3
USER jenkins
