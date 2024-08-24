#!/bin/bash
OVPN_FILE=./ovpn_profile/admin.ovpn
echo "Import .ovpn config"
openvpn3 config-import --config $OVPN_FILE --name myvpn
#openvpn3 config-import --config $OVPN_FILE --name myvpn --persistent

echo "Add access control"
openvpn3 config-acl --show --lock-down true --grant $USER --config myvpn

echo "add service in systemctl"
sudo systemctl enable --now openvpn3-session@myvpn.service