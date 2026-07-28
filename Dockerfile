FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# xfce4 masaüstü ve diğer gerekli paketleri kur
RUN apt-get update && apt-get install -y \
    xvfb x11vnc novnc websockify \
    xfce4 xfce4-terminal dbus-x11 \
    && rm -rf /var/lib/apt/lists/*

# Başlatma dosyasını kopyala ve yetki ver
COPY start.sh /start.sh
RUN chmod +x /start.sh

# noVNC ana sayfasını ayarla
RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

# Konteyner ayağa kalktığında start.sh çalışsın
CMD ["/start.sh"]
