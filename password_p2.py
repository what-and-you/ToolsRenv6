#!/usr/bin/env python3

import os
import sys
import getpass

# Nama file untuk menyimpan password
PASSWORD_FILE = "save_password.txt"

# Password default yang akan disimpan
DEFAULT_PASSWORD = "ren9999"

# Fungsi untuk menyimpan password ke file
def save_password(password):
    with open(PASSWORD_FILE, "w") as f:
        f.write(password)

# Fungsi untuk memuat password dari file
def load_password():
    if os.path.exists(PASSWORD_FILE):
        with open(PASSWORD_FILE, "r") as f:
            return f.read().strip()
    return None

# Coba muat password dari file
saved_password = load_password()

if saved_password:
    # Jika password sudah disimpan, tidak perlu minta input lagi
    print("Password sudah tersimpan. Melanjutkan...")
    sys.exit(0)  # Berhasil, password ditemukan
else:
    # Jika password belum disimpan, simpan password default
    save_password(DEFAULT_PASSWORD)
    print(f"Password default '{DEFAULT_PASSWORD}' berhasil disimpan.")
    sys.exit(0)  # Berhasil
