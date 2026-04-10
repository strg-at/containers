#!/bin/bash
pkill docker || true # kills any running docker processes
mkdir -p /home/user/docker/buildkit # creates the docker & buildkit directories in the home directory
cat<<EOF>/home/user/docker/buildkit/buildkitd.toml # required to use fuse-overlayfs
[worker.oci]
  snapshotter = "native"
EOF
