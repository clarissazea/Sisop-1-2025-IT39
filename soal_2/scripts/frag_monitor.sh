#!/bin/bash

LOG_DIR="./log"
LOG_FILE="$LOG_DIR/fragment.log"

# Pastikan folder log ada
mkdir -p "$LOG_DIR"

# Ambil informasi RAM dari /proc/meminfo
TOTAL_MEM=$(grep "MemTotal" /proc/meminfo | awk '{print $2}')
FREE_MEM=$(grep "MemAvailable" /proc/meminfo | awk '{print $2}')

# Hitung penggunaan RAM dalam persen
USED_MEM=$((TOTAL_MEM - FREE_MEM))
RAM_USAGE_PERCENT=$(echo "scale=2; ($USED_MEM / $TOTAL_MEM) * 100" | bc)

# Konversi dari KB ke MB
TOTAL_MEM_MB=$((TOTAL_MEM / 1024))
USED_MEM_MB=$((USED_MEM / 1024))
AVAILABLE_MEM_MB=$((FREE_MEM / 1024))

# Format timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Simpan ke log file
echo "[$TIMESTAMP] - Fragment Usage [$RAM_USAGE_PERCENT%] - Fragment Count [$USED_MEM_MB MB] - Details [Total: $TOTAL_MEM_MB MB, Available: $AVAILABLE_MEM_MB MB]" >> "$LOG_FILE"
