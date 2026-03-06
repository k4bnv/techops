# =====================================================
# TechOps — Branded Vaultwarden Image
# =====================================================
# Базируется на официальном образе vaultwarden/server
# Встраивает брендинг (логотипы) и шаблоны напрямую в образ
# =====================================================

FROM vaultwarden/server:latest

LABEL maintainer="TechOps" \
      description="TechOps branded Vaultwarden" \
      version="1.0"

# Копируем кастомные логотипы в web-vault
COPY branding/ /web-vault/images/techops/

# Копируем кастомные шаблоны (email, SCSS)
COPY templates/ /data/templates/

# Устанавливаем переменные окружения по умолчанию
ENV ORG_NAME="TechOps" \
    TEMPLATES_FOLDER=/data/templates \
    SIGNUPS_ALLOWED=false \
    INVITATIONS_ALLOWED=true \
    LOG_LEVEL=warn \
    EXTENDED_LOGGING=true
