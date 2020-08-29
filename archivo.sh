#!/bin/bash

ip=$(hostname -I)
hostname=$(cat /etc/hostname)
time=$(date '+%s')

echo "HOSTNAME -> "$hostname", ip -> "$ip", time -> "$time"" 
