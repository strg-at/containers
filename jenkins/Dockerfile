FROM docker.io/jenkins/jenkins:2.479.2-jdk17@sha256:e728082cd6a2710840ef7d9fdcdc93408eb488aa05d10bc92f4454254e22cc4e
USER root

# prepare installation of gcloud sdk
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# install base packages
RUN apt update && apt install rsync wget python3 \
     build-essential clang libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
     curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev \
     liblzma-dev python3 google-cloud-cli google-cloud-sdk-gke-gcloud-auth-plugin lsb-release -y

# prepare installation of php packages
RUN curl -fsSL https://packages.sury.org/php/apt.gpg | tee /etc/apt/trusted.gpg.d/sury.gpg > /dev/null && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install helm 3
RUN wget https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get-helm-3 && ./get-helm-3

# install php7.1, php7.2, php7.3 and php8.1
RUN apt update && apt install -y \
    php7.1 php7.1-cli php7.1-xml php7.1-zip \
    php7.2 php7.2-cli php7.2-xml php7.2-zip \
    php7.3 php7.3-cli php7.3-xml php7.3-zip \
    php8.1 php8.1-cli php8.1-xml php8.1-zip

# install composer version 2.2.24 (v3 does not support PHP <7.2.5)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer2 --version=2.2.24

# set php7.1 as default
RUN update-alternatives --set php /usr/bin/php7.1

USER jenkins

# install pyenv, python 3.6.8 and create venv
RUN curl https://pyenv.run | bash && \
    CC=clang ~/.pyenv/bin/pyenv install 3.6.8 && \
    ~/.pyenv/bin/pyenv virtualenv 3.6.8 timeline-service-venv
