#!/bin/bash

DB_PATH="data/player.csv"
SALT="arcaea_salt"  # Static salt for hashing

echo "=============================="
echo "=      REGISTER ACCOUNT      ="
echo "=============================="

read -p "Enter your email: " EMAIL
read -p "Enter your username: " USERNAME
read -s -p "Enter password: " PASSWORD
echo ""

# Validasi format email
if ! [[ "$EMAIL" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Invalid email format!"
    exit 1
fi

# Validasi password (8 karakter, 1 huruf besar, 1 huruf kecil, 1 angka)
if ! [[ "$PASSWORD" =~ [A-Z] && "$PASSWORD" =~ [a-z] && "$PASSWORD" =~ [0-9] && ${#PASSWORD} -ge 8 ]]; then
    echo "Password must have at least 8 characters, 1 uppercase letter, 1 lowercase letter, and 1 number!"
    exit 1
fi

# Periksa apakah database ada
if [ ! -f "$DB_PATH" ]; then
    echo "email,username,password_hash" > "$DB_PATH"
fi

# Periksa apakah email sudah terdaftar
if grep -q "^$EMAIL," "$DB_PATH"; then
    echo "Email already registered!"
    exit 1
fi

# **Hash password dengan salt**
HASHED_PASSWORD=$(echo -n "${PASSWORD}${SALT}" | sha256sum | awk '{print $1}')

# Simpan ke database
echo "$EMAIL,$USERNAME,$HASHED_PASSWORD" >> "$DB_PATH"
echo "Registration successful!"
