a=$HOSTNAME
b=$(hostname -I)
c=$(date -u)
d=$(df -k .)
e=$(ps aux | grep sh)
f=$(ps aux | sort -nrk 3,3 | head -n 1)
x="${a}\n ${b}\n ${c}\n ${d}\n ${e}\n ${f}"

echo -e "${x}"
