#!/bin/bash

set -euo pipefail

hostname_info() {
    echo "===== HOSTNAME & OS ====="
    hostname
    cat /etc/os-release | grep PRETTY_NAME
}

uptime_info() {
    echo
    echo "===== UPTIME ====="
    uptime
}

disk_info() {
    echo
    echo "===== DISK USAGE ====="
    du -sh /* 2>/dev/null | sort -hr | head -n 5 || true
}

memory_info() {
    echo
    echo "===== MEMORY USAGE ====="
    free -h
}

cpu_info() {
    echo
    echo "===== TOP CPU PROCESSES ====="
    ps aux --sort=-%cpu | head -6
}

main() {
    hostname_info
    uptime_info
    disk_info
    memory_info
    cpu_info
}

main
