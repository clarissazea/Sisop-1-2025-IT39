<div align=center>

  # Sisop-1-2025-IT39
  
</div>

# Soal_1
a. Membuat Direktori dan Masuk ke Direktori
```bash
mkdir soal_1 && cd soal_1
```
b. Membuat File Script. File script ini akan berisi perintah-perintah untuk memproses data dari reading_data.csv.
```bash
nano poppo_siroyo.sh
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

Membuat file login.sh
```bash
$ nano login.sh
```
nano login.sh
[Login Scripts](https://github.com/clarissazea/Sisop-1-2025-IT39/blob/3745a7a4feb319daf11c82a19ee95240568a604c/soal_2/login.sh)

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
