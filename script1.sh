#!/bin/bash                                                                     
variable=$(hostname)
variable1=$(hostname -i)
variable2=$(date +%s)
variable3=$(vm)
echo -HOSTNAME: $variable -IP: $variable1 -Timestamp: $variable2 -RamFree: $variable3

