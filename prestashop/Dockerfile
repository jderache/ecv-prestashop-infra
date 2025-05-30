FROM prestashop/prestashop:8.1

# Rester en tant que root pour toute la configuration
USER root

# Mettre à jour les paquets et installer les langues françaises
RUN apt-get update && apt-get install -y \
    locales \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Configuration des langues françaises
RUN echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen fr_FR.UTF-8

# Variables d'environnement pour les langues
ENV LANG=fr_FR.UTF-8
ENV LANGUAGE=fr_FR:fr
ENV LC_ALL=fr_FR.UTF-8

# Installation du thème classique
RUN cd /var/www/html/themes/ \
    && wget https://github.com/PrestaShop/classic-theme/archive/refs/heads/develop.zip \
    && unzip develop.zip \
    && rm develop.zip

# Créer les répertoires nécessaires s'ils n'existent pas
RUN mkdir -p /var/www/html/var \
    /var/www/html/config \
    /var/www/html/cache \
    /var/www/html/log \
    /var/www/html/img \
    /var/www/html/upload \
    /var/www/html/download

# Supprimer les fichiers de lock potentiels
RUN rm -f /var/www/html/install/install_lock.txt \
    /var/www/html/app/config/parameters.php \
    /var/www/html/config/settings.inc.php 2>/dev/null || true

# Configurer les permissions pour l'installation automatique
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    chmod -R 777 /var/www/html/var \
    /var/www/html/config \
    /var/www/html/cache \
    /var/www/html/log \
    /var/www/html/img \
    /var/www/html/upload \
    /var/www/html/download

# Expose le port 80
EXPOSE 80