#!/bin/bash

#This script prints the hostname, the assigned ip address and the current timestamp.
echo "The hostname is" $HOSTNAME
echo "The ip address is" $(hostname -I | awk '{print $2}')
echo "The current timestamp is" $(date '+%s')
