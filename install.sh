#!/bin/bash

clear
echo "================================="
echo " INSTALL AI CONTROL SYSTEM v17"
echo "================================="

# update
pkg update -y && pkg upgrade -y

# install package
pkg install git -y
pkg install bash -y
pkg install curl -y
pkg install python -y

# permission
chmod +x pro.sh

# selesai
echo ""
echo "✅ INSTALL SELESAI"
echo "Jalankan dengan:"
echo "bash pro.sh"
