#!/usr/bin/env zsh

host=$1
vpn_host_list="$HOME/.config/vpn/volvo-vpn-hosts"

if [[ -f $vpn_host_list ]]; then
    echo "Adding $host to VPN hosts"
    $host >> "$vpn_host_list \\"
fi
