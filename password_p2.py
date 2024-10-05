#!/usr/bin/env python3

import os
import getpass
import sys

# Nama file untuk menyimpan password
PASSWORD_FILE = "save_password.txt"

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
    # Jika password sudah disimpan, gunakan password yang tersimpan
    user_input = getpass.getpass("Masukkan password: ")
    if user_input == saved_password:
        print("Password benar.")
        sys.exit(0)  # Berhasil
    else:
        print("Password salah.")
        sys.exit(1)  # Gagal
else:
    # Jika password belum disimpan, minta user memasukkan dan simpan ke file
    user_input = getpass.getpass("Masukkan password untuk pertama kali: ")
    confirm_password = getpass.getpass("Konfirmasi password: ")

    if user_input == confirm_password:
        save_password(user_input)
        print("Password berhasil disimpan.")
        sys.exit(0)  # Berhasil
    else:
        print("Password tidak cocok. Gagal menyimpan password.")
        sys.exit(1)  # Gagal
