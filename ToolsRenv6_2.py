import os
import time
import signal
import subprocess

# Nama file tempat menyimpan password
PASSWORD_FILE = "/sdcard/save_password.txt"
CORRECT_PASSWORD = "ren9999"

# Fungsi untuk memeriksa password
def check_password():
    if os.path.exists(PASSWORD_FILE):
        with open(PASSWORD_FILE, 'r') as file:
            password = file.read().strip()
        print("HALLOOO PENGGUNAA PREMIUM, SELAMAT DATANG DI TOOLSRENV6")
        time.sleep(2)
        return True

    user_input = input("Masukkan password: ")
    if user_input == CORRECT_PASSWORD:
        print("Password benar. anda di izinkan masuk ke dalam script")
        time.sleep(2)
        os.system('clear')
        text = ("setelah kamu berhasil memasukan password, nanti akan otomatis membuat file di /sdcard  kamu"
                "yang bernama save_password.txt"
                "jadi kamu jangan menghapus filenya nanti kalo di hapus "
                "nanti di suruh masukin ulang password nya")
        for char in text:
            print(char, end='', flush=True)
            time.sleep(0.01)
        print("\nPencet enter untuk melanjutkan")
        input()
        with open(PASSWORD_FILE, 'w') as file:
            file.write(user_input)
        return True
    else:
        print("Password salah. anda tidak di izinkan masuk!!!")
        time.sleep(1.5)
        return False

def trap_ctrl_c(signum, frame):
    print("\nAnda menekan Ctrl + C, kembali ke menu utama...")
    time.sleep(1.5)
    show_menu()

def show_menu():
    os.system('clear')
    print("\033[0;35m               __________  ____  __   _____ ____  _______   ___    _______")
    print("              /_  __/ __ \\/ __ \\/ /  / ___// __ \\/ ____/ | / / |  / / ___/")
    print("              / / / / / / / / / /   \\__ \\/ /_/ / __/ /  |/ /| | / / __ \\ ")
    print("             / / / /_/ / /_/ / /______/ / _, _/ /___/ /|  / | |/ / /_/ / ")
    print("            /_/  \\____/\\____/_____/____/_/ |_/_____/_/ |_/  |___/\\____/")
    print("            SCRIPT BY: REN9999")
    print("            VERSION  : 6.0.0")
    print("            STATUS   : PREMIUM ðŸ‘‘\033[0m\n")
    
    text = ("            1.dorking 1\n"
            "            2.dorking 2\n"
            "            3.install bahan\n"
            "            4.set music\n"
            "            5.keluar")
    for char in text:
        print(char, end='', flush=True)
        time.sleep(0.02)
    print("\n")
    time.sleep(1.5)
    print("â•­â”€â”€â”€â‰¼TOOLSRENV6â€¢~/PILIH MENUâ‰½\nâ•°â”€â”€â•¼âœ  ", end="")

def dorking1():
    os.chdir('dorking-tools')
    os.system('python dork.py')

def dorking2():
    os.chdir('XGDork')
    os.system('python XGDork.py')

def install_bahan():
    os.system('pkg update && pkg upgrade')
    os.system("sed -i 's/\\r$//' ToolsRenv6_bash.py")
    os.system('pkg install git')
    os.system('pkg install python python2 python3')
    os.system('git clone https://github.com/SystemOfPekalongan/dorking-tools.git')
    os.system('git clone https://github.com/E4rr0r4/XGDork.git')
    
def set_music():
    while True:
        # Menjalankan script music_menu dan menunggu input dari pengguna
        os.system('./music_menu')
        
        # Tanya kepada pengguna apakah ingin kembali ke menu utama
        kembali = input("Apakah Anda ingin kembali ke menu utama? (y/n): ")
        if kembali.lower() == 'y':
            break  # Keluar dari loop dan kembali ke menu utama

if __name__ == "__main__":
    signal.signal(signal.SIGINT, trap_ctrl_c)
    
    if not check_password():
        exit(1)
    
    while True:
        show_menu()
        choice = input()
        if choice == '1':
            dorking1()
        elif choice == '2':
            dorking2()
        elif choice == '3':
            install_bahan()
        elif choice == '4':
            set_music()  # Menjalankan set_music
        elif choice == '5':
            print("Keluar dari script")
            time.sleep(1.5)
            break
        else:
            print("Pilih yang bener bangg")
            time.sleep(1)
