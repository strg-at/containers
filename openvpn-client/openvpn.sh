#!/usr/bin/bash

OVPN_CONFIG_FILE=/app/openvpn-client.ovpn

# We check if the OpenVPN configuration file is present. If it is
if test -f "$OVPN_CONFIG_FILE"; then
    printf "OpenVPN configuration file has been found, attempting connection.\n\r"
    openvpn --user nobody --config $OVPN_CONFIG_FILE > /tmp/openvpn.log 2>&1 &

    # We wait for the success message of openvpn to consider that we are connected
    if grep -m 1 "Initialization Sequence Completed" <(tail -n 0 -f /tmp/openvpn.log); then
        printf "Connected to the VPN.\n\r"
        tail -f /dev/null # ugly hack to keep the container running.
    else
        printf "Connection to the VPN has failed. Please check the contents of /tmp/openvpn.log for further information.\n\r"
        exit 1
    fi
else
    echo "The OpenVPN configuration file has not been found, please create it in /home/user/openvpn-client.ovpn!"
    exit 1
fi
