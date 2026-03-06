FROM vaultwarden/server:latest

# Копируем PNG-логотипы
COPY ./branding/logo.png /web-vault/images/logo-dark@2x.png
COPY ./branding/logo.png /web-vault/images/logo-light@2x.png
COPY ./branding/logo.png /web-vault/images/logo.png
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# Копируем SVG-логотипы (содержат встроенный base64-PNG — работает без внешних зависимостей)
COPY ./branding/logo.svg /web-vault/images/logo.svg
COPY ./branding/logo-white.svg /web-vault/images/logo-white.svg
COPY ./branding/logo-dark.svg /web-vault/images/logo-dark.svg
COPY ./branding/icon.svg /web-vault/images/icon.svg
