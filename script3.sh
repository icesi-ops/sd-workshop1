#!/bin/bash                                                                    \
                                                                                
h=$(hostname)
ip=$(hostname -i)
date=$(date +%s)
ram=$(free -h)
echo -HOSTNAME: $h -IP: $ip -Timestamp: $date -Ram: $ram

