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
