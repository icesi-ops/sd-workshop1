#!/bin/bash
#script print HOSTNAME + IP + Timestamp server.
echo -n "'$HOSTNAME'" 
echo -n "+ $(hostname -I | awk '{print $2}')"
TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`
echo -n "+'$TIMESTAMP'"
