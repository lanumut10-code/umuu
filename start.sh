#!/bin/bash
export DISPLAY=:0

# Çözünürlüğü ve ekran performansını optimize et
Xvfb :0 -screen 0 1366x768x24 -ac +extension GLX +render &
sleep 2

startxfce4 &

# VNC sunucusunu maksimum performans ve sıkıştırma ile başlat
x11vnc -display :0 -nopw -listen localhost -xkb -forever -shared -q &

# Railway portuna yönlendir
websockify --web=/usr/share/novnc/ $PORT localhost:5900
