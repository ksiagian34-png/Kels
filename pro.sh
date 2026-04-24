#!/data/data/com.termux/files/usr/bin/bash

# ===== FILE =====
TOKEN_FILE="$HOME/token.txt"

# ===== UI =====
banner(){
clear
echo "=============================="
echo " 🤖 AI CONTROL SYSTEM v16"
echo "=============================="
}

pause(){ read -p "ENTER..."; }

# ===== GENERATE TOKEN =====
generate_token(){
token=$(date +%s | sha256sum | head -c 6)
echo "$token" > "$TOKEN_FILE"
echo "🔐 TOKEN ANDA: $token"
echo "Berikan token ini ke ADMIN"
}

# ===== VALIDASI TOKEN =====
check_token(){
read -p "Masukkan token: " t
saved=$(cat "$TOKEN_FILE" 2>/dev/null)

if [ "$t" = "$saved" ]; then
  echo "✔ Akses diberikan"
  return 0
else
  echo "❌ Token salah"
  return 1
fi
}

# ===== FITUR =====
alarm_hp(){
while true; do
termux-tts-speak "Perangkat ditemukan!" 2>/dev/null
sleep 2
done
}

ambil_foto(){
file="$HOME/foto.jpg"
termux-camera-photo "$file" 2>/dev/null
echo "✔ Foto: $file"
}

get_location(){
termux-location 2>/dev/null || echo "❌ Gagal"
}

# ===== CLIENT MODE =====
client_mode(){
banner
echo "📱 MODE PERANGKAT"
echo "1. Aktifkan Tracking (generate token)"
echo "2. Kirim Lokasi"
echo "3. Ambil Foto"
echo "0. Kembali"

read -p "Pilih: " c

case "$c" in
1) generate_token ;;
2) get_location ;;
3) ambil_foto ;;
esac

pause
}

# ===== ADMIN PANEL =====
admin_panel(){

banner
echo "🔐 ADMIN PANEL"
echo "Masukkan token target"

check_token || return

while true; do
echo ""
echo "1. 📍 Lihat Lokasi"
echo "2. 📸 Ambil Foto"
echo "3. 🔊 Bunyi Alarm"
echo "0. Kembali"

read -p "Pilih: " a

case "$a" in
1) get_location ;;
2) ambil_foto ;;
3) alarm_hp ;;
0) break ;;
esac

done
}

# ===== MAIN =====
while true; do
banner
echo "1. 📱 Mode Perangkat (Client)"
echo "2. 🔐 Admin Panel"
echo "0. Exit"

read -p "Pilih: " m

case "$m" in
1) client_mode ;;
2) admin_panel ;;
0) exit ;;
*) echo "❌ salah"; sleep 1 ;;
esac

done
