#!/bin/bash

echo $HOSTNAME
echo `ip -4 addr show eth1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
echo `date`
echo `awk '/Mem:/ {print $4}' <(free -m)` MB

