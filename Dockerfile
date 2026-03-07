FROM vaultwarden/server:latest

# Копируем остальной брендинг (иконки вкладок, почты и т.д.)
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/logo-email.png /web-vault/images/logo-email.png
