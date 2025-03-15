#!/bin/bash

DB_PATH="data/player.csv"
SALT="arcaea_salt"  # Static salt harus sama dengan register.sh

echo "=============================="
echo "=           LOGIN            ="
echo "=============================="

read -p "Enter your email: " EMAIL
read -s -p "Enter password: " PASSWORD
echo ""

# Periksa apakah file database ada
if [ ! -f "$DB_PATH" ]; then
    echo "No players registered yet. Please register first!"
    exit 1
fi

# Periksa apakah email ada di database
if ! grep -q "^$EMAIL," "$DB_PATH"; then
    echo "Email not found! Please register first."
    exit 1
fi

# Ambil hash password dari database
STORED_HASH=$(grep "^$EMAIL," "$DB_PATH" | cut -d ',' -f3)

# Hash input password dengan salt
HASHED_INPUT=$(echo -n "${PASSWORD}${SALT}" | sha256sum | awk '{print $1}')

# Cocokkan hash
if [ "$HASHED_INPUT" == "$STORED_HASH" ]; then
    USERNAME=$(grep "^$EMAIL," "$DB_PATH" | cut -d ',' -f2)
    echo "Login successful! Welcome, $USERNAME."
	./scripts/core_monitor.sh  # Jalankan monitoring CPU
	./scripts/frag_monitor.sh  # Jalankan monitoring RAM
else
    echo "Incorrect password! Try again."
    exit 1
fi
