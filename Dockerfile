FROM vaultwarden/server:latest

# Copy your custom branding files into the web-vault images directory
# We replace the default Bitwarden/Vaultwarden logos with your custom ones
COPY ./branding/logo.png /web-vault/images/logo-dark@2x.png
COPY ./branding/logo.png /web-vault/images/logo-light@2x.png
COPY ./branding/logo.png /web-vault/images/logo.png
COPY ./branding/logo-icon.png /web-vault/images/icon.png
COPY ./branding/favicon-32.png /web-vault/images/favicon.ico

# Email logo (if needed by your templates or email service)
COPY ./branding/logo-email.png /web-vault/images/logo-email.png

# (Optional) You can also create a templates folder if you want to customize emails, etc.
# COPY ./templates /data/templates
