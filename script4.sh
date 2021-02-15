#!/bin/bash
h=$(hostname)
ip=$(hostname -i)
timestap=$(date +%s)
ram=$(free -h)
echo -HOSTNAME: $h -IP: $ip -Timestamp: $timestap -Ramfree: $ram
