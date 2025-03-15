#!/bin/bash

while true; do
    clear
    echo -e "\e[38;5;255m$(figlet -f standard 'ARCAEA TERMINAL')\e[0m"
    echo "================================="
    echo "=      ARCAEA TERMINAL          ="
    echo "================================="
    echo "1. Register"
    echo "2. Login"
    echo "3. Crontab Manager"
    echo "4. Exit"
    echo "================================="
    read -p "Select an option [1-4]: " OPTION

    case $OPTION in
        1)  
            ./register.sh
            ;;
        2)  
            ./login.sh
            ;;
        3)  
            ./scripts/manager.sh
            ;;
        4)  
            echo "Exiting system..."
            exit 0
            ;;
        *)
            echo "Invalid option! Please select between 1-4."
            ;;
    esac
    read -p "Press Enter to continue..."
done
