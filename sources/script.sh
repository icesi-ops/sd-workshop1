#!/bin/bash

show_memory(){
	free -m | grep Mem | awk '{print("RAM Memory:\nFree:", ($4/$2)*100, "%", "\nUsed:", ($3/$2)*100, "%", "\nShared:", ($5/$2)*100,"%", "\nBuff/Cache:", ($6/$2)*100, "%", "\nAvailable:", ($7/$2), "%")}'
}

echo -e "Hostname: $(echo "$HOSTNAME") \nIp: $(hostname -I) \nDate: $(date)"; show_memory
