#!/bin/bash

LOG_FILE=~/MyFirewall/logs/firewall.log
THRESHOLD=20

echo "Anomaly Detection Started..."

while true
do
    # Capture current connections
    ss -tunap | awk '{print $5}' | cut -d: -f1 | sort | uniq -c > /tmp/connections.txt

    while read count ip
    do
        # skip header / invalid
        if ! [[ "$count" =~ ^[0-9]+$ ]]; then
            continue
        fi

        # detect anomaly
        if [ "$count" -gt "$THRESHOLD" ]
        then
            echo "[ALERT] Suspicious activity from IP: $ip (Connections: $count)"

            echo "[$(date)] ALERT: $ip exceeded connection threshold ($count)" >> $LOG_FILE
        fi

    done < /tmp/connections.txt

    sleep 10
done
