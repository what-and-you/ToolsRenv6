#!/bin/bash

# Nama file tempat menyimpan password
PASSWORD_FILE="/sdcard/save_password.txt"
CORRECT_PASSWORD="ren9999"
FILE="/sdcard/user_name.txt"
REPO_URL="https://github.com/what-and-you/ToolsRenv6.git"
LOCAL_DIR="/ToolsRenv6_py2.sh"  # Ganti dengan path lokal ke repositorimu

# Fungsi untuk memeriksa password
check_password() {
    if [[ -f "$PASSWORD_FILE" ]]; then
        PASSWORD=$(cat "$PASSWORD_FILE")
        clear
        sleep 1.5
        text="HALLOOO PENGGUNAA PREMIUM, SELAMAT DATANG DI TOOLSRENV6"
        echo -en "\033[1;34m"
for ((i=0; i<${#text}; i++)); do
    echo -n "${text:$i:1}"
    sleep 0.0001
done
        echo -en "\033[0m"
sleep 2
        return 0
    fi



# Fungsi untuk memperbarui repositori
function update_repo() {
    if [ ! -d "$LOCAL_DIR" ]; then
        echo "Mengkloning repositori..."
        git clone "$REPO_URL" "$LOCAL_DIR"
    else
        echo "Memeriksa pembaruan..."
        cd "$LOCAL_DIR" || exit
        git fetch origin
        LOCAL_HASH=$(git rev-parse HEAD)
        REMOTE_HASH=$(git rev-parse origin/main)  # Ganti 'main' jika branch utama berbeda

        if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
            echo "Pembaruan tersedia. Memperbarui repositori..."
            git pull origin main  # Ganti 'main' jika branch utama berbeda
            echo "Repositori diperbarui."
        else
            echo "Repositori sudah terbaru."
        fi
    fi
   slelep 1.5
}

# Panggil fungsi update_repo


# Lanjutkan dengan eksekusi skrip lainnya...



    echo -n "Masukkan password: "
    read -s USER_INPUT
    echo 

    if [[ "$USER_INPUT" == "$CORRECT_PASSWORD" ]]; then
        echo "Password benar. Anda diizinkan masuk ke dalam script"
        sleep 2
        clear
        text="setelah kamu berhasil memasukan password, nanti akan otomatis membuat file di /sdcard/save_password.txt jadi jangan hapus filenya nanti kalau dihapus disuruh masukin ulang passwordnya"
        for ((i=0; i<${#text}; i++)); do
            echo -n "${text:$i:1}"
            sleep 0.01
        done
        echo
        echo "Tekan enter untuk melanjutkan"
        read -p " "
        echo "$USER_INPUT" > "$PASSWORD_FILE"
        return 0
    else
        echo "Password salah. Anda tidak diizinkan masuk!!!"
        sleep 1.5
        return 1
    fi
}

# Panggil fungsi untuk memeriksa password
check_password || exit 1

sleep 1.5
clear

# Fungsi untuk menanyakan nama user jika belum ada atau ingin diubah
function input_nama_user() {
    read -p "Masukkan nama user: " nama_user
    echo "$nama_user" > "$FILE"
    echo "Nama user telah disimpan."
}

# Cek apakah file nama user sudah ada
if [[ ! -f "$FILE" ]]; then
    echo "Nama user belum ada. Silakan masukkan nama user."
    input_nama_user
else
    nama_user=$(cat "$FILE")
fi

update_repo
sleep 1.5
clear


trap_ctrl_c() {
    echo -e "\nAnda menekan Ctrl + C, kembali ke menu utama..."
    sleep 1.5
    show_menu
}

show_menu() {
    clear
    echo -e "\033[1;92m
                              ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠈⠉⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣤⣄⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠾⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⣤⣶⣤⣉⣿⣿⡯⣀⣴⣿⡗⠀⠀⠀⠀⣿⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⡈⠀⠀⠉⣿⣿⣶⡉⠀⠀⣀⡀⠀⠀⠀⢻⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⡇⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⢸⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠉⢉⣽⣿⠿⣿⡿⢻⣯⡍⢁⠄⠀⠀⠀⣸⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠐⡀⢉⠉⠀⠠⠀⢉⣉⠀⡜⠀⠀⠀⠀⣿⣿⣿⣿⣿
                              ⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠘⣤⣭⣟⠛⠛⣉⣁⡜⠀⠀⠀⠀⠀⠛⠿⣿⣿⣿
                              ⡿⠟⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⡀⠀⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉
                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\033[0m"
    echo
    echo
    echo -e "'\033[1;34m
                 |=================================================|
                 |=================================================|
                 | name     :{$nama_user}                            |
                 | SCRIPT BY: REN9999                              |
                 | VERSION  : 6.0.0                                |
                 | STATUS   : PREMIUM                              |
                 |=================================================|
                            ||                          ||
                 |=================================================|
                 |=================================================|
                 | 1. Google Dorking            6. Spam Sms v2     |
                 | 2. Hack Sosmed               7. Spam Sms v3     |
                 | 3. Ren_DDos                  8. Spam Sms v4     |
                 | 4. ENC-BASH                  9. install bahan   |
                 | 5. Spam Sms v1               10. exit           |
                 |=================================================|
                            ||                          ||
                 |=================================================|
                 | bug    (report bug)                             |
                 | user   (ganti nama user)                        |
                 | kata (Kata-kata har ini                         |
                 |=================================================|\033[0m"
    echo
    sleep 1.5
    echo              
    echo
    echo -n "PILIH MENU: "
}

function dorking_1 {
    clear
    cd dorking-tools
    python dork.py
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function hack_sosmed {
    clear
    cd zphisher
    bash zphisher.sh
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function ren_ddos {
    clear
    cd ren_ddos
    python ren_ddos.py
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function enc_bash {
    clear
    cd enc_bash
    bash enc_bash_enc.sh
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function spam_menu1 {
    clear
    cd brutal
    python3 brutal.py
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function spam_menu2 {
    clear
    cd Brutal-W4
    ./main
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function spam_menu3 {
    clear
    cd SpamSms
    python2 mantan.py
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function spam_menu4 {
    clear
    cd SpamSms
    python2 mantan.py
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function install_bahan {
    clear
    echo "Menginstall bahan, harap tunggu..."
    sleep 2
    pkg update && pkg upgrade
    pkg install git python python2 python3
    git clone https://github.com/SystemOfPekalongan/dorking-tools.git
    git clone https://github.com/E4rr0r4/XGDork.git
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
    apt update && apt upgrade
apt install git -y
apt install python3-pip
git clone https://github.com/FatihArridho/brutal.git
pip3 insttill -r install.txt
apt update && apt upgrade
pkg install bash curl wget jq
pkg install python python-pip
pkg install make clang
pkg install git
git clone https://github.com/Sxp-ID/Brutal-W4.git
apt update && apt upgrade
apt install python2
apt install php
apt install git
git clone https://github.com/joss24242/SpamSms.git
git clone https://github.com/what-and-you/ren_ddos.git
git clone https://github.com/what-and-you/enc_bash.git
git clone https://github.com/htr-tech/zphisher.git
git pull
make install
    echo "Instalasi selesai! Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

function ganti_user() {
    clear
    echo "Nama user saat ini: $nama_user"
    input_nama_user
}

function kata_1 {
    clear
    text="Kata-kata motivasi untuk hari ini..."
    echo -e "\033[1;92m$text\033[0m"
    echo "Tekan enter untuk kembali ke menu utama..."
    read -p ""
}

while true; do
    trap trap_ctrl_c SIGINT
    show_menu
    read choice
    case $choice in
        1) dorking_1 ;;
        2) hack_sosmed ;;
        3) ren_ddos ;;
        4) enc_bash ;;
        5) spam_menu1 ;;
        6) spam_menu2 ;;
        7) spam_menu3 ;;
        8) spam_menu4 ;;
        9) install_bahan ;;
        10) echo "Keluar dari script"; sleep 1.5; break ;;
        user) ganti_user ;;
        kata) kata_1 ;;
        *) echo "Pilih menu yang ada!"; sleep 1 ;;
    esac
done
