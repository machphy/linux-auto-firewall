#!/bin/bash

for i in {1..5}
do
    echo "Failed password for invalid user test from 192.168.1.150 port 22 ssh2" | sudo tee -a /var/log/auth.log
done

echo "Test attack generated"
