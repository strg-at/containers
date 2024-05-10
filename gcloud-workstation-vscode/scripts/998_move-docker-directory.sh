#!/usr/bin/bash

# If the /var/lib/docker directory exists
if [ -d /var/lib/docker ]; then
    pkill -9 dockerd # Stop the docker daemon
    pkill -9 containerd # Stop the containerd daemon
    mkdir -p /home/user/docker # Create the new home for docker files
    mv /var/lib/docker/* /home/user/docker/ # Move the contents of /var/lib/docker to /home/user/docker
    rm -rf /var/lib/docker # Remove the /var/lib/docker directory
    sed -i 's/\/var\/lib\/docker/\/home\/user\/docker/g' /var/run/docker/containerd/containerd.toml # Update the containerd daemon configuration file
    /usr/bin/dockerd -p /var/run/dockerd.pid --data-root /home/user/docker &>/dev/null & disown # Start the docker daemon in the background
    containerd --config /home/user/docker/containerd/containerd.toml &>/dev/null & disown # Start the containerd daemon in the background
fi
