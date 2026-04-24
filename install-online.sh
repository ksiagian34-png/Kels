#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 Installing AI Control System..."

pkg update -y
pkg install git -y

cd ~
rm -rf Kels

git clone https://github.com/ksiagian34-png/Kels.git
cd Kels

chmod +x pro.sh install.sh

echo "✅ Install selesai"
echo "Menjalankan AI System..."

bash pro.sh
