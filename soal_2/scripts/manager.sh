#!/bin/bash

CPU_MONITOR_PATH="$(pwd)/scripts/core_monitor.sh"
RAM_MONITOR_PATH="$(pwd)/scripts/frag_monitor.sh"

# Menampilkan Menu
while true; do
    clear
    echo "=================================================="
    echo "=        	    ARCAEA TERMINAL              ="
    echo "=================================================="
    echo "ID  | OPTION					 |"
    echo "--------------------------------------------------"
    echo "1   | Add CPU - Core Monitor to Crontab	         |"
    echo "2   | Add RAM - Fragment Monitor to Crontab	 |"
    echo "3   | Remove CPU - Core Monitor from Crontab	 |"
    echo "4   | Remove RAM - Fragment Monitor from Crontab |"
    echo "5   | View All Scheduled Monitoring Jobs	 |"
    echo "6   | Exit Arcaea Terminal			 |"
    echo "=================================================="
    read -p "Enter option [1-6]: " OPTION

    case $OPTION in
        1) 
            (crontab -l 2>/dev/null; echo "*/1 * * * * $(pwd)/scripts/core_monitor.sh") | crontab -	
		chmod +x scripts/core_monitor.sh
            echo "CPU Monitor activated & added to Crontab (runs every 1 minutes)."
            ;;
        2)
            (crontab -l 2>/dev/null; echo "*/1 * * * * $(pwd)/scripts/frag_monitor.sh") | crontab -
		chmod +x scripts/frag_monitor.sh
		nohup frag_monitor.sh > /dev/null 2>&1 &
            echo "RAM Monitor activated & added to Crontab (runs every 1 minutes)."
            ;;
        3)
            crontab -l | grep -v "$(pwd)/scripts/core_monitor.sh" | crontab -
		pkill -f scripts/core_monitor.sh
            echo "CPU Monitor deactivated & removed from Crontab."
            ;;
        4)
            crontab -l | grep -v "$(pwd)/scripts/frag_monitor.sh" | crontab -
		pkill -f scripts/frag_monitor.sh
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
