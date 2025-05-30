FROM prestashop/prestashop:8.1

# Mettre à jour les paquets et installer les langues françaises
USER root
RUN apt-get update && apt-get install -y \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Configuration des langues françaises
RUN echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen fr_FR.UTF-8

# Variables d'environnement pour les langues
ENV LANG=fr_FR.UTF-8
ENV LANGUAGE=fr_FR:fr
ENV LC_ALL=fr_FR.UTF-8

# Retour à l'utilisateur www-data (sécurité)
USER www-data

# Expose le port 80
EXPOSE 80