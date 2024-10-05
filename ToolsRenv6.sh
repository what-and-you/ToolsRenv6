#!/bin/bash

python3 ./password_p.py

if [[ $? -eq 0 ]]; then
    echo "Melanjutkan eksekusi script..."
else
    echo "Menghentikan eksekusi script."
    exit 1
fi

check_package() {
    if ! command -v $1 &> /dev/null; then
        echo "Paket '$1' belum diinstal."
        read -p "Apakah Anda ingin menginstalnya? (y/n): " choice
        if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
            pkg install $1 -y
        else
            echo "Paket '$1' diperlukan untuk melanjutkan. Script dihentikan."
            exit 1
        fi
    else
        echo "Paket '$1' sudah diinstal."
    fi
}
required_packages=("git" "curl" "python" "python2" "python3")

for package in "${required_packages[@]}"; do
    check_package $package
done
clear
echo "Semua bahan telah diinstal. Melanjutkan script..."
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