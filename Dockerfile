FROM vaultwarden/server:latest

# Копируем остальной брендинг (иконки вкладок, почты и т.д.)
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico
COPY ./branding/favicon-32.png /web-vault/vw_static/vaultwarden-favicon.png
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# Меняем заголовок вкладки в Web Vault и встраиваем CSS скрывающий логотип до подгрузки основного CSS (убирает моргание)
RUN sed -i 's/<title>Vaultwarden<\/title>/<title>TechOps<\/title>/g' /web-vault/index.html || true \
    && sed -i 's/Bitwarden Web Vault/TechOps Web Vault/g' /web-vault/index.html || true \
    && sed -i 's|<head>|<head><style>a[href="#/"] bit-icon, svg[viewBox="0 0 290 60"], .tw-fill-marketing-logo, .logo-inline, .navbar-brand img, .navbar-brand svg { display: none !important; }</style>|g' /web-vault/index.html || true
