#!/bin/bash

LOG_FILE="/var/log/auth.log"
BLOCK_LIST=~/MyFirewall/rules/blocked_ips.txt
FIREWALL_LOG=~/MyFirewall/logs/firewall.log
THRESHOLD=5

echo "Real-time Auto Firewall Started..."

tail -Fn0 $LOG_FILE | while read line
do
    if echo "$line" | grep "Failed password" > /dev/null
    then
        ip=$(echo "$line" | awk '{print $(NF-3)}')

        # Count attempts
        count=$(grep "$ip" $LOG_FILE | grep "Failed password" | wc -l)

        if [ "$count" -ge "$THRESHOLD" ]
        then
            if ! grep -q "$ip" $BLOCK_LIST
            then
                echo "[+] Blocking IP: $ip (Attempts: $count)"

                sudo ufw deny from $ip

                echo "$ip" >> $BLOCK_LIST
                echo "[$(date)] Blocked $ip after $count attempts" >> $FIREWALL_LOG
            fi
        fi
    fi
done
