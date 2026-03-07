FROM vaultwarden/server:latest

# Копируем PNG логотипы
COPY ./branding/logo.png /web-vault/images/logo-dark@2x.png
COPY ./branding/logo.png /web-vault/images/logo-light@2x.png
COPY ./branding/logo.png /web-vault/images/logo-white@2x.png
COPY ./branding/logo.png /web-vault/images/logo.png
COPY ./branding/logo.png /web-vault/images/logo-dark.png
COPY ./branding/logo.png /web-vault/images/logo-white.png
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# Создаем SVG-обертки на лету, которые просто отобразят ваш logo.png на 100% ширины и высоты
# Благодаря preserveAspectRatio="xMidyMid meet", обрезанный PNG будет максимально крупным
RUN printf '<?xml version="1.0" encoding="UTF-8"?>\n\
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="100%%" height="100%%">\n\
    <image href="/images/logo.png" x="0" y="0" width="100%%" height="100%%" preserveAspectRatio="xMidYMid meet"/>\n\
    </svg>' > /web-vault/images/logo.svg \
    && cp /web-vault/images/logo.svg /web-vault/images/logo-white.svg \
    && cp /web-vault/images/logo.svg /web-vault/images/logo-dark.svg
