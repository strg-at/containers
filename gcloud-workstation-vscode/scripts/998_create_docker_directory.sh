#!/bin/bash
pkill docker || true # kills any running docker processes
mkdir -p /home/user/docker # creates the docker directory in the home directory
