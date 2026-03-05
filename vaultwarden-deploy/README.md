# 🔐 TechOps Vaultwarden

> Брендированный Vaultwarden с логотипом TechOps, готовый к деплою в Coolify одной кнопкой.

[![Deploy to Coolify](https://coolify.io/deploy-button.svg)](https://coolify.io/deploy?repo=https://github.com/YOUR_USERNAME/techops-vaultwarden)
[![Validate](https://github.com/YOUR_USERNAME/techops-vaultwarden/actions/workflows/validate.yml/badge.svg)](https://github.com/YOUR_USERNAME/techops-vaultwarden/actions)

---

## 🚀 Деплой в Coolify — одной кнопкой

### Способ 1: Кнопка выше
Нажми **Deploy to Coolify** → укажи свой Coolify → настрой переменные → Deploy!

### Способ 2: GitHub репозиторий через Coolify UI

1. **Coolify UI** → **Projects** → выбери проект (или создай `TechOps`)
2. **New Resource** → **Docker Compose**
3. **Source:** выбери `GitHub` → выбери этот репозиторий
4. **Branch:** `main`
5. **Docker Compose Path:** `docker-compose.yml` (корень репо)
6. **Domain:** `vault.yourdomain.com`
7. Вкладка **Environment Variables** → добавь переменные (см. ниже)
8. **Save** → **Deploy** 🎉

> После первого деплоя Coolify автоматически передеплоит при каждом `git push`!

---

## 🔧 Переменные окружения в Coolify

| Переменная | Пример | Секретная? |
|-----------|--------|-----------|
| `DOMAIN` | `https://vault.client.com` | Нет |
| `ADMIN_TOKEN` | (см. генерацию ниже) | **✓ Да** |
| `SMTP_HOST` | `smtp.gmail.com` | Нет |
| `SMTP_FROM` | `noreply@client.com` | Нет |
| `SMTP_USERNAME` | логин SMTP | Нет |
| `SMTP_PASSWORD` | пароль SMTP | **✓ Да** |
| `SIGNUPS_ALLOWED` | `false` | Нет |

### Генерация ADMIN_TOKEN

```bash
# На сервере Coolify (SSH):
openssl rand -base64 48

# PowerShell (локально):
[Convert]::ToBase64String([System.Security.Cryptography.RandomNumberGenerator]::GetBytes(48))
```

---

## 📁 Структура репозитория

```
├── docker-compose.yml          ← Coolify читает это
├── .env.example                ← Шаблон переменных
├── branding/
│   ├── logo.png                ← Шапка web-vault (640×160)
│   ├── logo-icon.png           ← Иконка приложения (192×192)
│   ├── favicon-32.png          ← Favicon (32×32)
│   └── logo-email.png          ← Email баннер (600×150)
├── templates/
│   ├── scss/
│   │   └── user.vaultwarden.scss.hbs   ← Кастомный CSS
│   └── email/admin/email/
│       └── email_header.html           ← Email заголовок
└── .github/workflows/
    └── validate.yml            ← CI: валидация compose
```

---

## 🖥️ Локальный запуск (разработка)

```bash
cp .env.example .env
# Отредактируй .env (ADMIN_TOKEN, DOMAIN)

docker compose up -d

# Открыть:
# http://localhost:8082        ← Vaultwarden
# http://localhost:8082/admin  ← Admin панель
```

---

## 📌 После деплоя

| URL | Что там |
|-----|---------|
| `https://vault.client.com` | Основной интерфейс |
| `https://vault.client.com/admin` | Admin панель |

### Первый запуск
1. Открой `/admin` → введи `ADMIN_TOKEN`
2. Зайди в **Users** → **Invite User** → пригласи клиента на email
3. Клиент получит письмо с TechOps брендингом ✉️

---

## 🎨 Как работает брендинг

Vaultwarden поддерживает `TEMPLATES_FOLDER` — папку с кастомными CSS и HTML шаблонами.

| Что заменяется | Способ |
|---------------|--------|
| Логотип в шапке | CSS `background-image` через `user.vaultwarden.scss.hbs` |
| Email заголовок | `email_header.html` с `img src` |
| Цвет кнопок | CSS переменные (синий TechOps градиент) |

---

<p align="center">Made with ☁️ by TechOps</p>
