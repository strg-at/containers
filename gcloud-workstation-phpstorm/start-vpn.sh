#/bin/bash
OVPN_CONFIG_FILE=~/openvpn-client.ovpn
# Killing any openvpn connections in case this script is used when openvpn processes are already running
sudo killall openvpn 2>/dev/null

# We check if the OpenVPN configuration file is present. If it is
if test -f "$OVPN_CONFIG_FILE"; then
    echo "OpenVPN configuration file has been found, attempting connection."
    sudo openvpn ~/openvpn-client.ovpn > /tmp/openvpn.log 2>&1 &
    # Giving time to openvpn to try and connect (the openvpn command does not exit upon successful connection)
    sleep 5
    # We check if the string "openvpn" is found in the existing connections and use this to consider if the connection was a success or not.
    if sudo netstat -tulpen | grep openvpn >/dev/null ;
    then
      echo "Connected to the VPN."
      exit 0
    else
      echo "Connection to the VPN has failed. Please check the contents of /tmp/openvpn.log for further information."
      exit 1
    fi
else
    echo "The OpenVPN configuration file is missing. Please make sure that it exists in the home directory of the "user" user as openvpn-client.ovpn."
    exit 1
fi
