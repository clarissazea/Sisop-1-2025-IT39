#!/bin/bash

LOG_FILE="logs/core.log"

# Pastikan folder logs ada
mkdir -p logs

# Ambil model CPU dari sistem
CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -n 1 | cut -d ':' -f2 | sed 's/^ *//')

# Fungsi untuk menghitung penggunaan CPU
get_cpu_usage() {
    read -ra CPU < <(head -n1 /proc/stat)  # Ambil data pertama dari /proc/stat dengan parsing yang benar
    
    IDLE_TIME=${CPU[4]}  # Waktu idle
    TOTAL_TIME=0
    
    for VALUE in "${CPU[@]:1}"; do
        ((TOTAL_TIME += VALUE))  # Akumulasi semua waktu CPU
    done

    echo "$TOTAL_TIME $IDLE_TIME"
}

# Ambil nilai awal CPU
FIRST_MEASURE=($(get_cpu_usage))
sleep 1  # Tunggu 1 detik
SECOND_MEASURE=($(get_cpu_usage))

# Hitung perubahan waktu CPU
TOTAL_DIFF=$((SECOND_MEASURE[0] - FIRST_MEASURE[0]))
IDLE_DIFF=$((SECOND_MEASURE[1] - FIRST_MEASURE[1]))

# Jika TOTAL_DIFF nol, hindari pembagian dengan nol
if [[ $TOTAL_DIFF -eq 0 ]]; then
    CPU_USAGE="0.00"
else
    CPU_USAGE=$(echo "scale=2; (100 * ($TOTAL_DIFF - $IDLE_DIFF)) / $TOTAL_DIFF" | bc)
fi

# Agar terlihat desimalnya
if [[ $(echo "$CPU_USAGE < 1" | bc -l) -eq 1 ]]; then
    CPU_USAGE="0$CPU_USAGE"
fi

# Simpan ke log file dengan format yang diminta
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$TIMESTAMP] - Core Usage [$CPU_USAGE%] - Terminal Model [$CPU_MODEL]" >> "$LOG_FILE"
