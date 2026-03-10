FROM vaultwarden/server:latest

# === Брендинг: иконки и фавиконы ===
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/favicon-32.png /web-vault/vw_static/vaultwarden-favicon.png
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# === Шаблоны: бакаем прямо в образ ===
COPY ./templates /data/templates

# === CSS: добавляем кастомные правила в vaultwarden.css ===
# Копируем файл со стилями и вшиваем его в конец CSS
COPY ./branding/techops-custom.css /tmp/techops-custom.css
RUN cat /tmp/techops-custom.css >> /web-vault/css/vaultwarden.css

# === Заголовок вкладки: меняем title в index.html ===
RUN sed -i 's|<title>Vaultwarden</title>|<title>TechOps</title>|g' /web-vault/index.html 2>/dev/null || true && \
    sed -i 's|Bitwarden Web Vault|TechOps|g' /web-vault/index.html 2>/dev/null || true
