FROM docker.io/jenkins/jenkins:2.462.2-jdk17
USER root

# prepare installation of gcloud sdk
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# install base packages
RUN apt update && apt install rsync wget google-cloud-cli lsb-release -y

# prepare installation of php packages
RUN curl -fsSL https://packages.sury.org/php/apt.gpg | tee /etc/apt/trusted.gpg.d/sury.gpg > /dev/null && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install helm 3
RUN wget https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get-helm-3 && ./get-helm-3

# install php7.1
RUN apt update && apt install -y \
    php7.1 php7.1-cli \
    php7.2 php7.2-cli \
    php7.3 php7.3-cli \
    php8.1 php8.1-cli

# install composer 1.6.5
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.6.5

# install composer 2.2.18
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer2 --version=2.2.18

USER jenkins
