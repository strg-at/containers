#!/usr/bin/bash

# If the /var/lib/docker directory exists
if [ -d /var/lib/docker ]; then
    pkill -9 dockerd # Stop the docker daemon
    pkill -9 containerd # Stop the containerd daemon
    mkdir -p /home/user/docker # Create the new home for docker files
    mv /var/lib/docker/* /home/user/docker/ # Move the contents of /var/lib/docker to /home/user/docker
    chown -R user:user /home/user/docker # Change the ownership of the new home for docker files
    rm -rf /var/lib/docker # Remove the /var/lib/docker directory
    sed -i 's/\/var\/lib\/docker/\/home\/user\/docker/g' /var/run/docker/containerd/containerd.toml # Update the containerd daemon configuration file
    /usr/bin/dockerd -p /var/run/dockerd.pid --data-root /home/user/docker &>/dev/null & disown # Start the docker daemon in the background
fi

# If the /home/user/docker directory exists, it implies that the data has already been moved
if [ -d /home/user/docker ]; then
    pkill -9 dockerd # Stop the docker daemon
    pkill -9 containerd # Stop the containerd daemon
    rm -rf /var/lib/docker || true # Remove the /var/lib/docker directory
    sed -i 's/\/var\/lib\/docker/\/home\/user\/docker/g' /var/run/docker/containerd/containerd.toml || true # Update the containerd daemon configuration file
    /usr/bin/dockerd -p /var/run/dockerd.pid --data-root /home/user/docker &>/dev/null & disown # Start the docker daemon in the background
fi
