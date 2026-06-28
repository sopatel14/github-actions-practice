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


# Check if the cache folder is empty
if [ ! -d "my-cache-folder" ] || [ -z "$(ls -A my-cache-folder)" ]; then
  echo "Cache Miss! Downloading files..."
  mkdir -p my-cache-folder
  
  # This simulates a download by creating a fake 10MB file
  dd if=/dev/urandom of=my-cache-folder/fake-deps.bin bs=1M count=10
else
  echo "Cache Hit! Skipping download."
fi