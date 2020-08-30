#!/bin/bash


ip=$(hostname -I)
hostname=$(cat /etc/hostname)
time=$(date +%s)


echo "Hostname "$hostname", IP "$ip", Timestamp "$time""

