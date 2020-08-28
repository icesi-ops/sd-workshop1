#!/bin/bash
#script print HOSTNAME + IP + Timestamp server
echo "hostname: $HOSTNAME + ip: $(hostname -I|awk '{print $2}') + timestamp: `date +%d-%m-%Y`"
