echo "hostname: $(hostname)"
echo "ip: $(curl --silent ipinfo.io/ip)"
echo "timestamp: $(date)"
echo "available disk space:"
echo "$(df -H /)"
echo "most consuming process running:"
echo "$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 2)"
