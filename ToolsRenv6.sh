#!/bin/bash

# Nama file tempat menyimpan password
PASSWORD_FILE="/sdcard/save_password.txt"
CORRECT_PASSWORD="ren9999"

# Fungsi untuk memeriksa password
check_password() {
    # Periksa apakah password sudah tersimpan di file
    if [[ -f "$PASSWORD_FILE" ]]; then
        PASSWORD=$(cat "$PASSWORD_FILE")
        echo "Password sudah tersimpan. Tidak perlu input lagi."
        sleep 1.5
        return 0
    fi

    # Jika file belum ada, minta input password pertama kali
    echo -n "Masukkan password: "
    read -s USER_INPUT
    echo # Untuk membuat baris baru setelah input

    # Verifikasi input dengan password yang benar
    if [[ "$USER_INPUT" == "$CORRECT_PASSWORD" ]]; then
        echo "Password benar. anda di izinkan masuk ke dalam script"
        clear 
        text="setelah kamu berhasil memasukan password, nanti akan otomatis membuat file di /secara kamu yang bernama save_password.txt jadi kamu jangan menghapus filenya nanti kalo di hapus di suruh masukin ulang password nya"
        for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.01
    done
        read -p " "
        echo "$USER_INPUT" > "$PASSWORD_FILE"
        return 0
    else
        echo "Password salah. anda tidak di izinkan masuk!!! "
        sleep 1.5
        return 1
    fi
}

# Panggil fungsi untuk memeriksa password
check_password || exit 1

sleep 1.5
clear
trap_ctrl_c() {
    echo -e "\nAnda menekan Ctrl + C, kembali ke menu utama..."
    sleep 1.5
    show_menu
}
show_menu() {
    clear
    echo -e "\033[0;35m               __________  ____  __   _____ ____  _______   ___    _______
              /_  __/ __ \/ __ \/ /  / ___// __ \/ ____/ | / / |  / / ___/
              / / / / / / / / / /   \__ \/ /_/ / __/ /  |/ /| | / / __ \ 
             / / / /_/ / /_/ / /______/ / _, _/ /___/ /|  / | |/ / /_/ / 
            /_/  \____/\____/_____/____/_/ |_/_____/_/ |_/  |___/\____/
            SCRIPT BY: REN9999
            VERSION  : 6.0.0\033[0m"
    echo
    echo
    echo
    text="            1.dorking 1
            2.dorking 2
            3.install bahan
            4.keluar"
    echo -en "\033[1;34m"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.02
    done
    echo -e "${normal}"
    echo
    sleep 1.5
    echo              
    echo
    echo -n "╭───≼TOOLSRENV6•~/PILIH MENU≽
╰──╼✠ "
echo -en "\033[0m"
}

function dorking1 {
    cd dorking-tools
    python dork.py
}

function dorking2 {
    cd XGDork
    python XGDork.py
}

function install_bahan {
    pkg update
    pkg upgrade
    sed -i 's/\r$//' ToolsRenv6.sh
    pkg install git
    pkg update && pkg upgrade
    pkg install python
    pkg install python2
    pkg install python3
    git clone https://github.com/SystemOfPekalongan/dorking-tools.git
    git clone https://github.com/E4rr0r4/XGDork.git
}

while true; do
    trap trap_ctrl_c SIGINT
    show_menu
    read choice
    case $choice in
        1) 
            dorking1
            ;;
        2) 
            dorking2
            ;;
        3)
            install_bahan
            ;;
        4) 
            echo "Keluar dari script"
            sleep 1.5
            break
            ;;
        *) 
            echo "Pilih yang bener bangg"
            sleep 1
            ;;
    esac
done
