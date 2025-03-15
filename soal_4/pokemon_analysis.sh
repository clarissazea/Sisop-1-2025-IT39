#!/bin/bash

# Bersihkan terminal dan tampilkan ASCII Art
clear
echo -e "\e[33m$(figlet -f big 'PoKeMoN')\e[0m"

# Cek jika tidak ada argumen
if [ $# -lt 2 ]; then
    echo "Usage: ./pokemon_analysis.sh data.csv [options]"
    echo "Try './pokemon_analysis.sh --help' for more information."
    exit 1
fi

# Baca parameter
FILE=$1
OPTION=$2
ARGUMENT=$3

# Jika user mengetik --help atau -h
if [[ "$OPTION" == "--help" || "$OPTION" == "-h" ]]; then
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

# Cek ada file?
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

# Menampilkan summary
show_summary() {
    highest_usage=$(awk -F',' 'NR>1 {if($2>max_usage){max_usage=$2; name=$1}} END {print name " with " max_usage "%"}' "$FILE")
    highest_raw=$(awk -F',' 'NR>1 {if($3>max_raw){max_raw=$3; name=$1}} END {print name " with " max_raw " uses"}' "$FILE")
    echo "Summary of $FILE"
    echo "Highest Adjusted Usage: $highest_usage"
    echo "Highest Raw Usage: $highest_raw"
}

# Buat sorting
sort_by_column() {
    if [ -z "$ARGUMENT" ]; then
        echo "Error: No sorting column provided"
        exit 1
    fi

    header=$(head -n 1 "$FILE")
    case "$ARGUMENT" in
        usage) col=2 ;;
        raw) col=3 ;;
        hp) col=6 ;;
        atk) col=7 ;;
        def) col=8 ;;
        spatk) col=9 ;;
        spdef) col=10 ;;
        speed) col=11 ;;
        name) col=1 ;; # Sort ascending
        *)
            echo "Error: Invalid sorting column"
            exit 1
            ;;
    esac

    echo "$header"
    if [ "$col" -eq 1 ]; then
        tail -n +2 "$FILE" | sort -t',' -k"$col"
    else
        tail -n +2 "$FILE" | sort -t',' -k"$col" -nr
    fi
}

# Mencari nama Pokemon tertentu
search_pokemon() {
    if [ -z "$ARGUMENT" ]; then
        echo "Error: No Pokemon name provided"
        exit 1
    fi

    header=$(head -n 1 "$FILE")
    result=$(grep -i "^$ARGUMENT," "$FILE")

    if [ -z "$result" ]; then
        echo "Error: No matching Pokemon found"
        exit 1
    fi

    echo "$header"
    echo "$result"
}

# Mencari berdasarkan type
filter_by_type() {
    if [ -z "$ARGUMENT" ]; then
        echo "Error: No type provided"
        exit 1
    fi

    header=$(head -n 1 "$FILE")
    result=$(awk -F',' -v type="$ARGUMENT" 'NR==1 || $4 == type || $5 == type' "$FILE" | sort -t',' -k2 -nr)

    if [ -z "$result" ]; then
        echo "Error: No Pokemon found for type '$ARGUMENT'"
        exit 1
    fi

    echo "$result"
}

# Menjalankan fitur sesuai dengan pilihan
case "$OPTION" in
    --info) show_summary ;;
    --sort) sort_by_column ;;
    --grep) search_pokemon ;;
    --filter) filter_by_type ;;
    *)
        echo "Error: Invalid option '$OPTION'"
        echo "Use --help for more information."
        exit 1
        ;;
esac
