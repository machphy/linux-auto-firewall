#!/bin/bash

BLOCK_LIST=~/MyFirewall/rules/blocked_ips.txt

read -p "Enter IP to unblock: " ip

if [[ -z "$ip" ]]; then
    echo "❌ Invalid IP"
    exit 1
fi

sudo ufw delete deny from $ip

sed -i "/$ip/d" $BLOCK_LIST

echo "[$(date)] Unblocked IP: $ip" >> ~/MyFirewall/logs/firewall.log

echo "✅ IP unblocked"