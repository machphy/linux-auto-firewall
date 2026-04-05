#!/bin/bash

API_KEY="YOUR_API_KEY"
IP=$1

response=$(curl -s "https://www.virustotal.com/api/v3/ip_addresses/$IP" \
-H "x-apikey: $API_KEY")

malicious=$(echo $response | grep -o '"malicious":[0-9]*' | cut -d ':' -f2)

if [[ -z "$malicious" ]]; then
    echo "UNKNOWN"
elif [ "$malicious" -gt 0 ]; then
    echo "MALICIOUS"
else
    echo "CLEAN"
fi
