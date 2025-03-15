<div align=center>

  # Sisop-1-2025-IT39
  
</div>

# Soal_1


# Soal_2
a. “First Step in a New World”
Tugas pertama, dikarenakan kejadian “Axiom of The End” yang semakin mendekat, diperlukan sistem untuk mencatat “Player” aktif agar terpisah dari “Observer”. Buatlah dua shell script, login.sh dan register.sh, yang dimana database “Player” disimpan di /data/player.csv. Untuk register, parameter yang dipakai yaitu email, username, dan password. Untuk login, parameter yang dipakai yaitu email dan password.

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
