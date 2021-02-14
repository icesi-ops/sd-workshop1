#!/bin/bash
echo "Hostname: $HOSTNAME"
echo "IP: $(hostname -I)"
echo "TImestamp: $(date)"
echo "Free ram: $(free -h | grep Mem | awk '{print $4}')"