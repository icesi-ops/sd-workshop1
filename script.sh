hostname=$HOSTNAME
ip=$(hostname -I | awk '{print $2}')
date=$(date '+%s')
ram=$(free -b)
echo "Hostname:  $hostname, Dirección IP:  $ip, Date: $date, Memoria Ram en Bytes: $ram"

