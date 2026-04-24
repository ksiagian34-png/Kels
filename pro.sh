#!/data/data/com.termux/files/usr/bin/bash

# ===== FILE =====
TOKEN_FILE="$HOME/token.txt"

# ===== UI =====
banner(){
clear
echo "=============================="
echo " 🤖 AI CONTROL SYSTEM v17 PRO"
echo "=============================="
}

pause(){ read -p "ENTER..."; }

# ===== TOKEN =====
generate_token(){
token=$(date +%s | sha256sum | head -c 6)
echo "$token" > "$TOKEN_FILE"
echo "🔐 TOKEN: $token"
}

check_token(){
read -p "Masukkan token: " t
saved=$(cat "$TOKEN_FILE" 2>/dev/null)

[ "$t" = "$saved" ] && return 0 || return 1
}

# ===== SYSTEM =====
boost(){
echo "⚡ Boost..."
sync
rm -rf ~/.cache/* 2>/dev/null
echo "✔ Done"
}

# ===== AI =====
ai(){
case "$1" in
*halo*) echo "Halo 👋";;
*game*) echo "FF, ML, PUBG siap 🎮";;
*) echo "AI: $1";;
esac
}

ai_chat(){
while true; do
read -p "> " i
[ "$i" = "exit" ] && break
ai "$i"
done
}

# ===== APP =====
open_app(){
monkey -p "$1" 1 >/dev/null 2>&1 && echo "✔ Dibuka" || echo "❌ Tidak ada"
}

menu_app(){
while true; do
banner
echo "🎮 APP MENU"
echo "1. Free Fire"
echo "2. Mobile Legends"
echo "3. PUBG"
echo "4. TikTok"
echo "5. Instagram"
echo "6. YouTube"
echo "0. Kembali"

read -p "Pilih: " a

case "$a" in
1) boost; open_app com.dts.freefireth ;;
2) boost; open_app com.mobile.legends ;;
3) boost; open_app com.tencent.ig ;;
4) open_app com.zhiliaoapp.musically ;;
5) open_app com.instagram.android ;;
6) open_app com.google.android.youtube ;;
0) break ;;
esac

done
}

# ===== TRACKING =====
lokasi(){ termux-location 2>/dev/null; }

foto(){
file="$HOME/foto.jpg"
termux-camera-photo "$file" 2>/dev/null
echo "✔ $file"
}

alarm(){
while true; do
termux-tts-speak "Perangkat ditemukan" 2>/dev/null
sleep 2
done
}

# ===== CLIENT =====
client(){
while true; do
banner
echo "📱 CLIENT"
echo "1. Generate Token"
echo "2. Lokasi"
echo "3. Foto"
echo "0. Back"

read -p "Pilih: " c

case "$c" in
1) generate_token; pause ;;
2) lokasi; pause ;;
3) foto; pause ;;
0) break ;;
esac

done
}

# ===== ADMIN =====
admin(){

check_token || { echo "❌ Token salah"; pause; return; }

while true; do
banner
echo "🔐 ADMIN PANEL"
echo "1. Lokasi"
echo "2. Foto"
echo "3. Alarm"
echo "4. Boost"
echo "0. Back"

read -p "Pilih: " a

case "$a" in
1) lokasi; pause ;;
2) foto; pause ;;
3) alarm ;;
4) boost; pause ;;
0) break ;;
esac

done
}

# ===== MAIN =====
while true; do
banner
echo "1. 📱 Client"
echo "2. 🔐 Admin Panel"
echo "3. 🎮 App Launcher"
echo "4. 🤖 AI Chat"
echo "0. Exit"

read -p "Pilih: " m

case "$m" in
1) client ;;
2) admin ;;
3) menu_app ;;
4) ai_chat ;;
0) exit ;;
*) echo "❌ salah"; sleep 1 ;;
esac

done
