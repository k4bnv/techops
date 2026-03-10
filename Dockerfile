FROM vaultwarden/server:latest

# === Брендинг: иконки и фавиконы ===
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/favicon-32.png /web-vault/vw_static/vaultwarden-favicon.png
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# === Шаблоны: НЕ в /data (там будет volume), а в отдельную папку ===
# TEMPLATES_FOLDER в docker-compose.yml должен указывать на /vw-templates
COPY ./templates /vw-templates
