#!/usr/bin/bash

# Move docker data directory to /home/user/docker

# If the /var/lib/docker directory exists
if [ -d /var/lib/docker ]; then
    pkill -9 dockerd # Stop the docker daemon
    pkill -9 containerd # Stop the containerd daemon
    mkdir -p /home/user/docker # Create the new home for docker files
    mv /var/lib/docker/* /home/user/docker/ # Move the contents of /var/lib/docker to /home/user/docker
    chown -R user:user /home/user/docker # Change the ownership of the new home for docker files
    rm -rf /var/lib/docker # Remove the /var/lib/docker directory
    sed -i 's/\/var\/lib\/docker/\/home\/user\/docker/g' /var/run/docker/containerd/containerd.toml # Update the containerd daemon configuration file
fi

# Setup docker rootless
rm /var/run/docker.sock
sudo -u user /usr/bin/dockerd-rootless-setuptool.sh install --skip-iptables

# Check if XDG_RUNTIME_DIR is already set
if grep XDG_RUNTIME_DIR /home/user/.zshrc; then
    echo "XDG_RUNTIME_DIR already set"
else
    echo "export XDG_RUNTIME_DIR=/home/user/.docker/run" >> /home/user/.zshrc
fi

# Check if PATH is already set
if grep PATH /home/user/.zshrc; then
    echo "PATH already set"
else
    echo "export PATH=/usr/bin:$PATH" >> /home/user/.zshrc
fi

# Check if DOCKER_HOST is already set
if grep DOCKER_HOST /home/user/.zshrc; then
    echo "DOCKER_HOST already set"
else
    echo "export DOCKER_HOST=unix:///home/user/.docker/run/docker.sock" >> /home/user/.zshrc
fi

sudo -u user dockerd-rootless.sh --iptables=false &>/dev/null & disown # Start the rootless docker daemon in the background
