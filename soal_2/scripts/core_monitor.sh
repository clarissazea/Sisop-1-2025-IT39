#!/bin/bash

LOG_DIR="./log"
LOG_FILE="$LOG_DIR/core.log"

# Pastikan folder log ada
mkdir -p "$LOG_DIR"

# Ambil model CPU dari sistem
CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -n 1 | cut -d ':' -f2 | sed 's/^ *//')

# Fungsi untuk menghitung penggunaan CPU
get_cpu_usage() {
    if command -v mpstat &> /dev/null; then
        CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf "%.2f", 100 - $NF}')
    else
        read -ra CPU < <(head -n1 /proc/stat)  
        IDLE_TIME=${CPU[4]}  
        TOTAL_TIME=0
        for VALUE in "${CPU[@]:1}"; do
            ((TOTAL_TIME += VALUE))  
        done
        echo "$TOTAL_TIME $IDLE_TIME"
    fi
}

# Jika mpstat tidak ada, gunakan metode manual
if ! command -v mpstat &> /dev/null; then
    FIRST_MEASURE=($(get_cpu_usage))
    sleep 1
    SECOND_MEASURE=($(get_cpu_usage))

    TOTAL_DIFF=$((SECOND_MEASURE[0] - FIRST_MEASURE[0]))
    IDLE_DIFF=$((SECOND_MEASURE[1] - FIRST_MEASURE[1]))

    if [[ $TOTAL_DIFF -eq 0 ]]; then
        CPU_USAGE="0.00"
    else
        CPU_USAGE=$(echo "scale=2; (100 * ($TOTAL_DIFF - $IDLE_DIFF)) / $TOTAL_DIFF" | bc)
    fi
fi

# Format timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Simpan ke log file
echo "[$TIMESTAMP] - Core Usage [$CPU_USAGE%] - Terminal Model [$CPU_MODEL]" >> "$LOG_FILE"
