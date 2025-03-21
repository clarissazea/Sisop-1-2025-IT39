<div align=center>

  # Sisop-1-2025-IT39
  
</div>

# SOAL_1

Dikerjakan oleh Clarissa Aydin Rahmazea (5027241014)


Poppo_siroyo.sh: Terdiri atas 4 command utama yaitu:

- Menampilkan jumlah buku yang dibaca oleh “Chris Hemsworth”.
- Menghitung rata-rata durasi membaca (Reading_Duration_Minutes) untuk buku-buku yang dibaca menggunakan “Tablet”.
- Menampilkan pembaca dengan rating tertinggi beserta nama (Name), judul bukunya (Book_Title), dan rating (Rating).
- Menampilkan genre yang paling populer di Asia setelah tanggal 31 Desember 2023 beserta jumlahnya.
  
a. Membuat Direktori dan Masuk ke Direktori
```bash
mkdir soal_1 && cd soal_1
```
b. Membuat File Script. File script ini akan berisi perintah-perintah untuk memproses data dari reading_data.csv. Kemudian unduh file dari google drive
```bash
nano poppo_siroyo.sh
```
```bash
#!/bin/bash
wget "https://drive.google.com/uc?export=download&id= ...." -O reading_data.csv
```
c. Menjalankan Script
```bash
./poppo_siroyo.sh
```
d. Memberikan Izin Eksekusi pada Script. Agar script dapat dijalankan dengan perintah ./poppo_siroyo.sh.
```bash
chmod +x poppo_siroyo.sh
```
e. Menjalankan Script Kembali
```bash
./poppo_siroyo.sh
```
f. Melihat Isi File CSV (menampilkan isi file)
```bash
more reading_data.csv
```
g. Mencari Data dengan strings dan grep. Menampilkan semua string yang dapat dibaca dari file reading_data.csv, dan menyaring output untuk mencari baris yang mengandung nama "Chris Hemsworth".
```bash
strings reading_data.csv | grep "Chris Hemsworth"
```
h. Menghitung Jumlah Buku yang Dibaca oleh Chris Hemsworth
```bash
awk -F',' '$2 ~ "Chris Hemsworth" {count++} END {print "Chris Hemsworth membaca "count" buku."}' reading_data.csv
```
i. Menambahkan Perintah ke Script. Membuka file poppo_siroyo.sh untuk menambahkan perintah yang sudah diuji.
```bash
nano poppo_siroyo.sh
```
j. Menghitung Rata-Rata Durasi Membaca dengan Tablet
```bash
awk -F',' '$8 == "Tablet" {sum += $6; count++} END {if (count > 0) print "Rata-rata durasi membaca dengan Tablet adalah " sum / count " menit."}' reading_data.csv
```
k. Menjalankan Script
```bash
./poppo_siroyo.sh
```
l. Menambahkan Perintah ke Script
```bash
nano poppo_siroyo.sh
```
m. Mencari Pembaca dengan Rating Tertinggi
```bash
awk -F',' 'NR > 1 {if ($7 > max) {title = $3; max = $7; name = $2}} END {print "Pembaca dengan rating tertinggi: " name " - " title " - " max}' reading_data.csv
```
n. Menjalankan Script
```bash
./poppo_siroyo.sh
```
o. Menambahkan Perintah ke Script
```bash
nano poppo_siroyo.sh
```
p. Mencari Genre Paling Populer di Asia Setelah 2023
```bash
awk -F, '$9 == "Asia" && $5 > "2023-12-31" {genres[$4]++} END {max = 0; for (genre in genres) {if (genres[genre] > max) {max = genres[genre]; most_common = genre;}} print "Genre paling populer di Asia setelah 2023 adalah " most_common " dengan " max " buku."}' reading_data.csv
```
q. Menjalankan Script
```bash
./poppo_siroyo.sh
```
r. Menggunakan kondisi if else untuk setiap soalnya.

```bash
#!/bin/bash

# Header
echo 
echo "  PROGRAM ANALISIS BUKU SEDERHANA  "
echo "-----------------------------------"
echo
echo "Pilih nomor soal yang ingin dijalankan:"
echo "1. Hitung buku yang dibaca Chris Hemsworth"
echo "2. Hitung rata-rata durasi membaca dengan Tablet"
echo "3. Cari pembaca dengan rating tertinggi"
echo "4. Cari genre paling populer di Asia setelah 2023"
echo

# Input pengguna
read -p "Masukkan nomor (1-4): " pilihan

# Mengunduh file CSV
echo -e "\nMengunduh data..."
wget "https://drive.google.com/uc?export=download&id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV" -O reading_data.csv > /dev/null 2>&1

# Memeriksa apakah file berhasil diunduh
if [ -f "reading_data.csv" ]; then
    echo -e "\nFile reading_data.csv berhasil diunduh.\n"

    # Jika pengguna memilih nomor 1
    if [ "$pilihan" == "1" ]; then
        chris_count=$(awk -F',' '$2 == "Chris Hemsworth" {count++} END {print count+0}' reading_data.csv)
        echo "Chris Hemsworth membaca $chris_count buku."

    # Jika pengguna memilih nomor 2
    elif [ "$pilihan" == "2" ]; then
        tablet_avg=$(awk -F',' '$8 == "Tablet" {sum += $6; count++} END {if (count > 0) print sum/count; else print 0}' reading_data.csv)
        echo "Rata-rata durasi membaca dengan Tablet adalah $tablet_avg menit."

    # Jika pengguna memilih nomor 3
    elif [ "$pilihan" == "3" ]; then
        highest_rating=$(awk -F',' 'NR > 1 {if ($7 > max) {max = $7; name = $2; title = $3}} END {print name " - " title " - " max}' reading_data.csv)
        echo "Pembaca dengan rating tertinggi: $highest_rating."

    # Jika pengguna memilih nomor 4
    elif [ "$pilihan" == "4" ]; then
        most_common_genre=$(awk -F',' '$9 == "Asia" && $5 > "2023-12-31" {genres[$4]++} END {max = 0; for (genre in genres) {if (genres[genre] > max) {max = genres[genre]; most_common = genre}} print most_common " dengan " max " buku."}' reading_data.csv)
        echo "Genre paling populer di Asia setelah 2023 adalah $most_common_genre."

    # Jika pengguna memasukkan nomor yang tidak valid
    else
        echo "Nomor tidak valid. Silakan pilih nomor 1-4."
    fi

else
    echo -e "\nGagal mengunduh file reading_data.csv."
fi

# Footer
echo
echo "  Terima Kasih telah menggunakan program ini!  "
echo "-----------------------------------------------"
echo
```





# Soal_2
a. “First Step in a New World”  
Pada soal, instruksi pertama adalah membuat direktori folder soal_2 yang di dalamnya terdapat 2 file (login.sh & register.sh) dan database /data/player.csv.

```bash
$ mkdir soal_2 && cd soal_2
$ nano register.sh
```
Membuat file register.sh
nano register.sh
[Register Scripts](https://github.com/clarissazea/Sisop-1-2025-IT39/blob/3745a7a4feb319daf11c82a19ee95240568a604c/soal_2/register.sh)
```bash
#!/bin/bash

DB_PATH="/data/player.csv"

# 3 parameter: email, username, password
if [ "$#" -ne 3 ]; then
    echo "Usage: ./register.sh <email> <username> <password>"
    exit 1
fi

EMAIL=$1
USERNAME=$2
PASSWORD=$3

# Cek apakah database sudah ada, jika tidak buat file dan tambahkan header
if [ ! -f "$DB_PATH" ]; then
    echo "email,username,password" > "$DB_PATH"
fi
# Tambahkan data baru ke database
echo "$EMAIL,$USERNAME,$PASSWORD" >> "$DB_PATH"
echo "Registrasi berhasil!"
```

Membuat file login.sh
```bash
$ nano login.sh
```
nano login.sh
[Login Scripts](https://github.com/clarissazea/Sisop-1-2025-IT39/blob/3745a7a4feb319daf11c82a19ee95240568a604c/soal_2/login.sh)
```bash
read -p "Enter your email: " EMAIL
read -s -p "Enter password: " PASSWORD
echo ""

# Memeriksa apakah file database ada
if [ ! -f "$DB_PATH" ]; then
    echo "No players registered yet. Please register first!"
    exit 1
fi

# Memeriksa apakah email ada di database
if ! grep -q "^$EMAIL," "$DB_PATH"; then
    echo "Email not found! Please register first."
    exit 1
fi

# Mengambil password yang tersimpan dari CSV
STORED_PASSWORD=$(grep "^$EMAIL," "$DB_PATH" | cut -d ',' -f3)

# Mencocokkan password
if [ "$PASSWORD" == "$STORED_PASSWORD" ]; then
    USERNAME=$(grep "^$EMAIL," "$DB_PATH" | cut -d ',' -f2)
    echo "Login successful! Welcome, $USERNAME."
else
    echo "Incorrect password! Try again."
    exit 1
fi
```
Membuat direktori database
```bash
$ chmod +x register.sh login.sh
$ sudo mkdir -p data
$ sudo touch data/player.csv
$ sudo chmod 777 data/player.csv
```
b. “Radiant Genesis”  
```bash
$ nano register.sh
```
Ubah sedikit dengan menambahkan kondisi sesuai aturan (minimal 8 karakter, 1 huruf kecil, 1 huruf besar, dan 1 angka). 
```bash
# Validasi password (minimal 8 karakter, 1 huruf besar, 1 huruf kecil, 1 angka)
    if ! [[ "$PASSWORD" =~ [A-Z] && "$PASSWORD" =~ [a-z] && "$PASSWORD" =~ [0-9] && ${#PASSWORD} -ge 8 ]]; then
        echo "Password does not meet security requirements!"
        echo "Must contain at least 8 characters, 1 uppercase, 1 lowercase, and 1 number."
        exit 1
    fi
```
c. “Unceasing Spirit”  
Mencegah duplikasi player dengan tidak bisa memakai email yang sama.
```bash
$ nano register.sh
```
```bash
# Mengecek apakah email sudah terdaftar
    if grep -q "^$EMAIL," "$DB_PATH"; then
        echo "Email already registered! Please use a different email."
        exit 1
    fi
```
d. “The Eternal Realm of Light”  
Algoritma hashing sha256sum untuk keamanan password
```bash
$ nano register.sh
```
```bash
#!/bin/bash

DB_PATH="/data/player.csv"
SALT="arcaea_salt"  # Static salt untuk hashing
.
.
.
# Hash password with salt
HASHED_PASSWORD=$(echo -n "${PASSWORD}${SALT}" | sha256sum | awk '{print $1}')

# Simpan ke database
echo "$EMAIL,$USERNAME,$HASHED_PASSWORD" >> "$DB_PATH"
echo "Registration successful!"
```
```bash
$ nano login.sh
```
```bash
#!/bin/bash

DB_PATH="/data/player.csv"
SALT="arcaea_salt"  # Static salt harus sama dengan register.sh
.
.
.
# Ambil hash password dari database
STORED_HASH=$(grep "^$EMAIL," "$DB_PATH" | cut -d ',' -f3)

# Hash input password dengan salt
HASHED_INPUT=$(echo -n "${PASSWORD}${SALT}" | sha256sum | awk '{print $1}')

# Mencocokkan hash
if [ "$HASHED_INPUT" == "$STORED_HASH" ]; then
    USERNAME=$(grep "^$EMAIL," "$DB_PATH" | cut -d ',' -f2)
    echo "Login successful! Welcome, $USERNAME."
else
    echo "Incorrect password! Try again."
    exit 1
fi
```
e. “The Brutality of Glass” 
Melacak penggunaan CPU (dalam persentase) yaitu CPU Model dari device  
Membuat folder scripts & file core_monitor.sh
```bash
$ mkdir scripts && cd scripts
$ nano core_monitor.sh
```
```bash
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
```
```bash
chmod +x scripts/core_monitor.sh
```
f. “In Grief and Great Delight”
RAM dipantau dalam persentase usage, dan juga penggunaan RAM sekarang. CPU dan RAM memiliki output yang sama dengan suatu package resource checker, ex: top, htop, btop, bpytop.  
Membuat file frag_monitor.sh pada folder scripts
```bash
nano frag_monitor.sh
```
```bash
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
```
```bash
chmod +x ./scripts/frag_monitor.sh
```
g. “On Fate's Approach”
Crontab manager (suatu menu) untuk mengatur jadwal pemantauan sistem.
Membuat file manager.sh dalam folder scripts
```bash
nano manager.sh
```
```bash
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
```
h. “The Disfigured Flow of Time”  
Membuat 2 log file, core.log dan fragment.log di folder ./log/, yang dimana masing-masing terhubung ke program usage monitoring untuk usage tersebut.  
```bash
$ mkdir -p logs && touch logs/core.log logs/fragment.log
nano core_monitor.sh
```
monitor.sh (pengeditan kode agar terhubung dengan core.log dan fragment.log)
```bash
#!/bin/bash

LOG_FILE="logs/core.log"

# Memastikan folder logs ada
mkdir -p logs

# Mengambil model CPU dari sistem
CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -n 1 | cut -d ':' -f2 | sed 's/^ *//')

# Menghitung penggunaan CPU
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
    CPU_USAGE=0.00
else
    CPU_USAGE=$(echo "scale=2; (100 * ($TOTAL_DIFF - $IDLE_DIFF)) / $TOTAL_DIFF" | bc)
fi

# Agar terlihat desimalnya
if [[ $(echo "$CPU_USAGE < 1" | bc -l) -eq 1 ]]; then
    CPU_USAGE="0$CPU_USAGE"
fi

# Simpan ke log file dengan format yang sesuai
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$TIMESTAMP] - Core Usage [$CPU_USAGE%] - Terminal Model [$CPU_MODEL]" >> "$LOG_FILE"
```
i. “Irruption of New Color”  
Membuat shell script terminal.sh, yang berisi user flow register, login, crontab manager, exit, exit  
```bash
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
```

# Soal_3
Dikerjakan oleh Muhammad Rafi' Adly (5027241082) Menggunakan 1 file script bash

Membuat File dsotm.sh
```bash
nano dsotm.sh
```
## a. Speak to Me  
Fitur: Memanggil API untuk menampilkan word of affirmation setiap detik.
```bash
SpeakToMe() {
        clear
        while true; do
                curl -s "Accept: application/json" "https://www.affirmations.dev" | jq -r '.affirmation'
                sleep 1
        done
}
```


## b. On the Run  
Fitur: Menampilkan progress bar dengan interval random antara 0.1 hingga 1 detik.
```bash
OnTheRun() {
        j=170
        i=0
        until [ $i -eq $j ]
        do
                clear
                echo "ᗷᕮᑎTᗩᖇ Yᕼ"
                echo -n "["
                for ((x=0; x<i; x++))
                do
                        echo -n "#"
                done
                echo -n "] $(( (i * 100) / j ))%"
                sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand() * (max-min)}')
                i=$((i + 1))
        done
        echo " "
        echo "SᕮᒪᕮSᗩI !!"
}
```

## c. Time  
Fitur: Menampilkan live clock dengan update setiap detik.
```bash
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
```
Menggunakan while loop untuk memperbarui live clock setiap 1 detik. Fungsi ```date``` untuk menampilkan waktu dengan format YYYY-MM-DD HH:MM:SS.

## d. Money  
Fitur: Menampilkan efek matrix dengan simbol mata uang.
```bash
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
```

## e. Brain Damage  
Fitur: Menampilkan daftar proses yang sedang berjalan, diperbarui setiap detik.
```bash
BrainDmg() {
        while true; do
                clear
                ps aux --sort=-%cpu | awk '{print $1, $2, $3, $4, $7, $10, $11}' | head -n 25
                sleep 1
        done
}
```
Menggunakan while loop supaya bisa ter-update setiap 1 detik. Untuk menampilkan task manager, menggunakan ```ps aux``` dan diurutkan berdasarkan cpu. Kemudian pipe ke fungsi ```awk '{print $1, $2, $3, $4, $7, $10, $11}'``` supaya hanya menampilkan USER, PID, %CPU, %MEM, TTY, TIME, dan COMMAND. Lalu pipe ke fungsi ```head -n 25``` supaya task manager hanya menampilkan pekerjaan yang diatas, setelah diurutkan berdasarkan cpu.
## Eksekusi

```bash
chmod +x dsotm.sh
```
## Menjalankan Program
```bash
./dsotm.sh --play="<Track>"
```
Ket. : ```<Track>``` diganti lagu yang dipilih



# Soal_4

A. Melihat Summary dari Data
```bash
#!/bin/bash

show_summary() {
    highest_usage=$(awk -F',' 'NR>1 {if($2>max_usage){max_usage=$2; name=$1}} END {print name " with " max_usage "%"}' "$FILE")
    highest_raw=$(awk -F',' 'NR>1 {if($3>max_raw){max_raw=$3; name=$1}} END {print name " with " max_raw " uses"}' "$FILE")
    echo "Summary of $FILE"
    echo "Highest Adjusted Usage: $highest_usage"
    echo "Highest Raw Usage: $highest_raw"
}
```
- highest_usage: Menggunakan awk untuk mencari Pokemon dengan persentase penggunaan tertinggi ($2 adalah kolom Adjusted Usage %).
- highest_raw: Menggunakan awk untuk mencari Pokemon dengan penggunaan mentah tertinggi ($3 adalah kolom Raw Usage count).
  
B. Mengurutkan Pokemon Berdasarkan Data Kolom
```bash
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
```
C. Mencari Nama Pokemon Tertentu
```bash
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
```

D. Mencari Pokemon Berdasarkan Filter Nama Type
```bash
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
```

E. Error Handling
```base
# Cek jika tidak ada argumen
if [ $# -lt 2 ]; then
    echo "Usage: ./pokemon_analysis.sh data.csv [options]"
    echo "Try './pokemon_analysis.sh --help' for more information."
    exit 1
fi

# Cek ada file?
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi
```
- Fungsi: Menangani kesalahan input pengguna.
- Memeriksa apakah jumlah argumen kurang dari 2 ($# -lt 2). Jika ya, tampilkan pesan penggunaan dan keluar.
- Memeriksa apakah file yang diberikan ada (-f "$FILE"). Jika tidak, tampilkan pesan error dan keluar.

F. Help Screen yang Menarik
```base
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
```
- Fungsi: Menampilkan layar bantuan yang informatif.
- Menampilkan petunjuk penggunaan skrip, termasuk opsi yang tersedia dan deskripsi singkat.

G. Main Script
```base
# Bersihkan terminal dan tampilkan ASCII Art
clear
echo -e "\e[33m$(figlet -f big 'PoKeMoN')\e[0m"

# Baca parameter
FILE=$1
OPTION=$2
ARGUMENT=$3

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
```
- fungsi: Menjalankan skrip utama.
- Membersihkan terminal dan menampilkan ASCII Art menggunakan figlet.
- Membaca parameter yang diberikan pengguna ($1, $2, $3).
- Menggunakan case untuk menjalankan fungsi yang sesuai berdasarkan opsi yang dipilih.
