#!/bin/bash

# Fungsi buat nampilin menu
music_menu() {
    echo "1. Play Musik"
    echo "2. Stop Musik"
    echo "3. kembali ke menu awal"
}

# Fungsi buat milih musik dan play
play_musik() {
    echo "Masukkan nama file musik (lokasi di /sdcard):"
    read file_musik
    if [ -f "/sdcard/$file_musik" ]; then
        mpv "/sdcard/$file_musik" &
        echo "Lagi muter: $file_musik"
    else
        echo "File musik gak ada. Coba cek lagi."
    fi
}

# Fungsi buat stop musik
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
            python ToolsRenv6_bash.py
            show_menu
            ;;
        *)
            echo "Pilihan gak valid, coba lagi."
            ;;
    esac
done
