#!/usr/bin/bash

# This script is run automatically by root in the container.
# Added sudo in case it needs to be run by the unprivileged user.
OVPN_CONFIG_FILE=/home/user/openvpn-client.ovpn

# Killing any openvpn connections in case this script is used when openvpn processes are already running
sudo pkill -9 openvpn 2>/dev/null

# Cleaning up any existing log file before attempting a new connection
sudo rm /tmp/openvpn.log || true

# We check if the OpenVPN configuration file is present. If it is
if test -f "$OVPN_CONFIG_FILE"; then
    printf "OpenVPN configuration file has been found, attempting connection.\n\r"
    sudo openvpn /home/user/openvpn-client.ovpn > /tmp/openvpn.log 2>&1 &

    # We wait for the success message of openvpn to consider that we are connected
    if tail -f /tmp/openvpn.log | grep -m 1 "Initialization Sequence Completed" 2>&1 >/dev/null; then
        printf "Connected to the VPN.\n\r"
        exit 0
    else
        printf "Connection to the VPN has failed. Please check the contents of /tmp/openvpn.log for further information.\n\r"
        exit 1
    fi
fi
