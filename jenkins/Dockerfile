FROM docker.io/jenkins/jenkins:2.462.2-jdk17@sha256:95313257a8cddbef83c74e3d577ea139aeae30c3c014ddcaa83a72b60409bbe1
USER root

# prepare installation of gcloud sdk
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# install base packages
RUN apt update && apt install rsync wget google-cloud-cli -y

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install helm 3
RUN wget https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get-helm-3 && ./get-helm-3

USER jenkins
