FROM vaultwarden/server:latest

# === Брендинг ===
# Фавиконы и почтовые иконки
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/favicon-32.png /web-vault/vw_static/vaultwarden-favicon.png
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# === CSS Кастомизация ===
# Бакаем шаблоны прямо в образ (не зависим от volume mount)
COPY ./templates /data/templates

# Дополнительно вшиваем наш CSS прямо в vaultwarden.css в web-vault
# (двойная страховка — работает даже если TEMPLATES_FOLDER не подхватится)
RUN echo "" >> /web-vault/css/vaultwarden.css && \
    printf '/* ===== TECHOPS CUSTOM BRANDING ===== */\na[href="#/"] bit-icon,svg[viewBox="0 0 290 60"],.tw-fill-marketing-logo,.logo-inline,.navbar-brand img,.navbar-brand svg{display:none!important}a[href="#/"]::after{content:"TechOps"!important;display:block!important;font-family:"Inter","Segoe UI",system-ui,sans-serif!important;font-size:44px!important;font-weight:800!important;color:#0d6efd!important;letter-spacing:-1.5px!important;line-height:1!important;margin-bottom:25px!important}.navbar-brand::after{content:"TechOps"!important;display:inline-block!important;font-family:"Inter","Segoe UI",system-ui,sans-serif!important;font-size:24px!important;font-weight:800!important;color:#0d6efd!important;letter-spacing:-1px!important;margin-left:5px!important}footer{display:none!important}html.theme_dark a[href="#/"]::after,html.theme_dark .navbar-brand::after{color:#fff!important}\n' >> /web-vault/css/vaultwarden.css

# === Заголовок вкладки ===
# Меняем title в index.html через sed
RUN sed -i 's|<title>Vaultwarden</title>|<title>TechOps</title>|g' /web-vault/index.html 2>/dev/null || true && \
    sed -i 's|Bitwarden Web Vault|TechOps|g' /web-vault/index.html 2>/dev/null || true
