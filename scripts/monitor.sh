#!/bin/bash

LOG_FILE=~/MyFirewall/logs/firewall.log

echo "📡 Monitoring started..."

while true
do
    ss -tunap | grep ESTAB | awk '{print $5 " -> " $6}' >> $LOG_FILE
    sleep 10
done
MAX_SIZE=1000000  # ~1MB

if [ -f "$FIREWALL_LOG" ] && [ $(stat -c%s "$FIREWALL_LOG") -gt $MAX_SIZE ]; then
    mv "$FIREWALL_LOG" "$FIREWALL_LOG.old"
    touch "$FIREWALL_LOG"
fi