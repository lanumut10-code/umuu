#!/bin/bash
export DISPLAY=:0

# 1. Arka planda 1280x720 bir sanal ekran oluştur
Xvfb :0 -screen 0 1280x720x16 &
sleep 2

# 2. Windows tarzı tam masaüstü ortamını (XFCE4) başlat
startxfce4 &

# 3. VNC sunucusunu sanal ekrana bağla
x11vnc -display :0 -nopw -listen localhost -xkb -forever &

# 4. noVNC'yi Railway'in atadığı porta bağla ve web'e aç
websockify --web=/usr/share/novnc/ $PORT localhost:5900
