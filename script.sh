#!/usr/bin/env bash
echo "$(hostname) $(hostname -I) | awk '{print $2}' $(date +"%T")"