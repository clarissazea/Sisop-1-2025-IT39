#!/bin/bash

SpeakToMe() {
        clear
        while true; do
                curl -s "Accept: application/json" "https://www.affirmations.dev" | jq -r '.affirmation'
                sleep 2
        done
}

OnTheRun() {
        clear
        echo "ᗷᕮᑎTᗩᖇ Yᕼ"
        echo -n "["
        for i in $(seq 1 170); do
                sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
                echo -n "#"
        done
        echo "] SᕮᒪᕮSᗩI !!"
}

Time() {
        while true; do
                clear
                echo "ᒍᗩᗰ ᗷᕮᖇᗩᑭᗩ"
                echo "====================================================="
                echo " "
                date +"%Y-%m-%d %H:%M:%S"
                sleep 1
        done
}

Money() {
        clear
        chars="$€£¥¢₹₩₿₣"
        cols=$(tput cols)
        rows=$(tput lines)
        while true; do
                col=$((RANDOM % cols))
                char=${chars:RANDOM%${#chars}:1}
                tput cup $((RANDOM % rows)) $col
                echo -e "\e[1;32m$char\e[0m"
                sleep 0.07
        done
}

BrainDmg() {
        while true; do
                clear
                ps -eo pid,comm --sort=-%mem | head -n 10
                sleep 1
        done

}

case "$1" in
        "--play=Speak to Me")
                SpeakToMe
                ;;
        "--play=On the Run")
                OnTheRun
                ;;
        "--play=Time")
                Time
                ;;
        "--play=Money")
                Money
                ;;
        "--play=Brain Damage")
                BrainDmg
                ;;
        *)
                echo "Pakai format yang benar --> $0 --play=\"<Track>\""
                ;;
esac
