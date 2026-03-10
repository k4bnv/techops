FROM vaultwarden/server:latest

# === Брендинг: иконки и фавиконы ===
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/favicon-32.png /web-vault/vw_static/vaultwarden-favicon.png
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# === Патчим index.html ===
# 1. Меняем заголовок вкладки браузера
# 2. Вставляем ранний CSS в <head> — он загружается ДО Angular и предотвращает моргание логотипа
# 3. Заменяем favicon на наш
RUN sed -i 's|<title>[^<]*</title>|<title>TechOps</title>|g' /web-vault/index.html 2>/dev/null || true \
    && sed -i 's|<head>|<head><style>a[href="#/"] bit-icon,svg[viewBox="0 0 290 60"],.tw-fill-marketing-logo,.logo-inline,.navbar-brand img,.navbar-brand svg{display:none!important}</style>|g' /web-vault/index.html 2>/dev/null || true \
    && sed -i 's|href="favicon.ico"|href="images/favicon.ico"|g' /web-vault/index.html 2>/dev/null || true \
    && sed -i 's|href="favicon-32x32.png"|href="images/favicon.ico"|g' /web-vault/index.html 2>/dev/null || true
