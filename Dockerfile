FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# Gerekli hafif grafik ve ses altyapısını kur
RUN apt-get update && apt-get install -y \
    xvfb x11vnc wget curl unzip \
    xfce4 xfce4-terminal \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
