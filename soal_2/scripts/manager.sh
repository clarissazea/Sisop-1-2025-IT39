#!/bin/bash

CPU_MONITOR_PATH="$(pwd)/scripts/core_monitor.sh"
RAM_MONITOR_PATH="$(pwd)/scripts/frag_monitor.sh"

# Pastikan script memiliki izin eksekusi
chmod +x "$CPU_MONITOR_PATH"
chmod +x "$RAM_MONITOR_PATH"

# Menampilkan Menu
while true; do
    clear
    echo "=================================================="
    echo "=                ARCAEA TERMINAL                ="
    echo "=================================================="
    echo "ID  | OPTION                                      |"
    echo "--------------------------------------------------"
    echo "1   | Add CPU - Core Monitor to Crontab          |"
    echo "2   | Add RAM - Fragment Monitor to Crontab      |"
    echo "3   | Remove CPU - Core Monitor from Crontab     |"
    echo "4   | Remove RAM - Fragment Monitor from Crontab |"
    echo "5   | View All Scheduled Monitoring Jobs         |"
    echo "6   | Exit Arcaea Terminal                       |"
    echo "=================================================="
    read -p "Enter option [1-6]: " OPTION
    case $OPTION in
        1) 
            crontab -l 2>/dev/null | grep -v "$CPU_MONITOR_PATH" | crontab - 
            (crontab -l 2>/dev/null; echo "*/1 * * * * $CPU_MONITOR_PATH") | crontab -
            echo "CPU Monitor activated & added to Crontab (runs every 1 minute)."
            ;;
        2)
            crontab -l 2>/dev/null | grep -v "$RAM_MONITOR_PATH" | crontab -
            (crontab -l 2>/dev/null; echo "*/1 * * * * $RAM_MONITOR_PATH") | crontab -
            echo "RAM Monitor activated & added to Crontab (runs every 1 minute)."
            ;;
        3)
            crontab -l | grep -v "$CPU_MONITOR_PATH" | crontab -
            pkill -f "$CPU_MONITOR_PATH"
            echo "CPU Monitor deactivated & removed from Crontab."
            ;;
        4)
            crontab -l | grep -v "$RAM_MONITOR_PATH" | crontab -
            pkill -f "$RAM_MONITOR_PATH"
            echo "RAM Monitor deactivated & removed from Crontab."
            ;;
        5)
            echo "Active Crontab Jobs:"
            crontab -l
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select 1-6."
            ;;
    esac

    read -p "Press Enter to continue..."
done
