#!/bin/bash

SpeakToMe() {
        clear
        while true
        do
                curl -s "Accept: application/json" "https://www.affirmations.dev" | jq -r '.affirmation'
                sleep 1
        done
}

OnTheRun() {
    j=100
    i=0
    progres=$(tput cols)
    until [ $i -eq $j ]
    do
        clear
        echo "ᗷᕮᑎTᗩᖇ Yᕼ"
        echo -n "["
        space=$(( (progres - 2) * i / j ))
        for ((x = 0; x < space; x++))
        do
            echo -n "#"
        done
        for ((x = space; x < progres - 2; x++))
        do
            echo -n " "
        done
        echo -n "] $(( (i * 100) / j ))%"
        sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand() * (max-min)}')
        i=$((i + 1))
    done
    echo " "
    echo "SᕮᒪᕮSᗩI !!"
}

Time() {
        while true
        do
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
        uang="$€£¥¢₹₩₿₣"
        y=$(tput cols)
        x=$(tput lines)
        while true
        do
                y2=$((RANDOM % y))
                uang2=${uang:RANDOM%${#uang}:1}
                tput cup $((RANDOM % x)) $y2
                echo "$uang2"
                sleep 0.07
        done
}

BrainDmg() {
        while true
        do
                clear
                ps aux --sort=-%cpu | awk '{print $1, $2, $3, $4, $7, $10, $11}' | head -n 25
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
