FROM vaultwarden/server:latest

# Устанавливаем ImageMagick для конвертации PNG → SVG (через PNG обёртку)
# или просто копируем PNG прямо в SVG-путь (браузер отображает PNG внутри SVG тега)
# Самый надёжный способ — просто подменить SVG-файл на наш PNG через тег <image>

# 1. Копируем PNG логотипы
COPY ./branding/logo.png /web-vault/images/logo-dark@2x.png
COPY ./branding/logo.png /web-vault/images/logo-light@2x.png
COPY ./branding/logo.png /web-vault/images/logo.png
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# 2. КРИТИЧНО: Подменяем SVG-файлы через inline SVG, который показывает наш PNG
# Vaultwarden грузит logo.svg и logo-white.svg — создаём их "на лету" командой RUN
RUN printf '<?xml version="1.0" encoding="UTF-8"?>\n\
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"\n\
    width="200" height="60" viewBox="0 0 200 60">\n\
    <image href="/images/logo.png" x="0" y="0" width="200" height="60"/>\n\
    </svg>' > /web-vault/images/logo.svg \
    && cp /web-vault/images/logo.svg /web-vault/images/logo-white.svg \
    && cp /web-vault/images/logo.svg /web-vault/images/logo-dark.svg
