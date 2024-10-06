#!/bin/bash

# Fungsi untuk menampilkan menu
music_menu() {
    echo "1. Play Musik"
    echo "2. Stop Musik"
    echo "3. Kembali ke menu awal"
}

# Fungsi untuk memilih musik dan memainkannya
play_musik() {
    echo "Masukkan nama file musik (lokasi di /sdcard):"
    read file_musik
    if [ -f "/sdcard/$file_musik" ]; then
        mpv "/sdcard/$file_musik" &
        echo "Lagi memutar: $file_musik"
    else
        echo "File musik tidak ditemukan. Coba cek lagi."
    fi
}

# Fungsi untuk menghentikan musik
stop_musik() {
    pkill mpv
    echo "Musik berhenti."
}

# Main script
while true; do
    music_menu
    echo "Pilih opsi:"
    read opsi

    case $opsi in
        1)
            play_musik
            ;;
        2)
            stop_musik
            ;;
        3)
            exit 0  # Keluar dari script Bash dan kembali ke Python
            ;;
        *)
            echo "Pilihan tidak valid, coba lagi."
            ;;
    esac
done
