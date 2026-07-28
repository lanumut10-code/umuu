#!/bin/bash
export DISPLAY=:0

# 1. Sanal ekranı başlat
Xvfb :0 -screen 0 1366x768x24 &
sleep 2

# 2. XFCE masaüstünü çalıştır
startxfce4 &

# 3. VNC sunucusunu devreye al
x11vnc -display :0 -nopw -listen localhost -xkb -forever &

# 4. noVNC web dosyalarını doğru dizinden Railway portuna tıkır tıkır bağla
websockify --web=/usr/share/novnc $PORT localhost:5900
