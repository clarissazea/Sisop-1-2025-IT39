#!/bin/bash

# Bersihkan terminal dan tampilkan ASCII Art
clear
echo -e "\e[33m$(figlet -f big 'PoKeMoN')\e[0m"

# Jika tidak ada argumen atau help screen tanpa file
if [ "$1" == "--help" ]  || [ "$1" == "-h" ] || [ "$2" == "--help" ] || [ "$2" == "-h" ]; then
    echo "Usage: ./pokemon_analysis.sh data.csv [options]"
    echo ""
    echo "Options:"
    echo "  --info            Display top-used Pokemon."
    echo "  --sort <column>   Sort by specified column."
    echo "                      Available columns:"
    echo "                        - usage   (Adjusted Usage %)"
    echo "                        - raw     (Raw Usage count)"
    echo "                        - name    (Pokemon name, alphabetical order)"
    echo "                        - hp      (Hit Points)"
    echo "                        - atk     (Physical Attack)"
    echo "                        - def     (Physical Defense)"
    echo "                        - spatk   (Special Attack)"
    echo "                        - spdef   (Special Defense)"
    echo "                        - speed   (Speed)"
    echo "  --grep <name>     Search for a specific Pokemon."
    echo "  --filter <type>   Filter by type."
    echo "  -h, --help        Show this help screen."
    exit 0
fi

# Cek jika tidak ada file yang diberikan
if [ $# -lt 2 ]; then
    echo "Usage: ./pokemon_analysis.sh data.csv [options]"
    echo "Try './pokemon_analysis.sh --help' for more information."
    exit 1
fi

FILE=$1
OPTION=$2
ARGUMENT=$3

# Cek apakah file ada
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

# Fungsi untuk menampilkan summary
show_summary() {
    highest_usage=$(awk -F',' 'NR>1 {if($2>max_usage){max_usage=$2; name=$1}} END {print name " with " max_usage}' "$FILE")
    highest_raw=$(awk -F',' 'NR>1 {if($3>max_raw){max_raw=$3; name=$1}} END {print name " with " max_raw " uses"}' "$FILE")
    echo "Summary of $FILE"
    echo "Highest Adjusted Usage: $highest_usage"
    echo "Highest Raw Usage: $highest_raw"
}

# Fungsi untuk sorting
sort_pokemon() {
    case "$ARGUMENT" in
        usage) column=2;;
        raw) column=3;;
        name) column=1;;
        hp) column=6;;
        atk) column=7;;
        def) column=8;;
        spatk) column=9;;
        spdef) column=10;;
        speed) column=11;;
        *) echo "Error: Invalid sort option"; exit 1;;
    esac

    if [ "$ARGUMENT" == "name" ]; then
        sort -t',' -k"$column" "$FILE"
    else
        head -n1 "$FILE"
        tail -n +2 "$FILE" | sort -t',' -k"$column" -nr
    fi
}

# Fungsi untuk mencari Pokemon dengan nama spesifik
grep_pokemon() {
    head -n1 "$FILE"
    tail -n +2 "$FILE" | grep -i -E "^$ARGUMENT" | sort -t',' -k2 -nr
}

# Fungsi untuk mencari berdasarkan tipe
filter_type() {
    head -n1 "$FILE"
    tail -n +2 "$FILE" | awk -F',' -v type="$ARGUMENT" 'tolower($4) == tolower(type) || tolower($5) == tolower(type)' | sort -t',' -k2 -nr
}

# Eksekusi berdasarkan opsi
case "$OPTION" in
    --info) show_summary;;
    --sort) sort_pokemon;;
    --grep) grep_pokemon;;
    --filter) filter_type;;
    *) echo "Error: Invalid option"; exit 1;;
esac
