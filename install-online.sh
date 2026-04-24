#!/data/data/com.termux/files/usr/bin/bash

clear
echo "=============================="
echo " AI CONTROL SYSTEM INSTALLER"
echo "=============================="

pkg update -y && pkg upgrade -y
pkg install git -y

echo "[+] Cloning project..."
git clone https://github.com/ksiagian34-png/Kels

cd Kels

echo "[+] Running system..."
bash main.sh
