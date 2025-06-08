# Infrastructure PrestaShop Dockerisée

Infrastructure complète PrestaShop avec monitoring, backup automatique et CI/CD.

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   PrestaShop    │    │     MySQL       │    │   phpMyAdmin    │
│   (port 8080)   │◄──►│   (database)    │◄──►│   (port 8081)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
┌─────────────────┐    ┌─────────▼───────┐    ┌─────────────────┐
│   Prometheus    │◄──►│   Grafana       │    │   Alertmanager  │
│   (port 9090)   │    │   (port 3000)   │    │   (port 9093)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
         ┌───────────────────────┼───────────────────────┐
         │                       │                       │
┌─────────▼───────┐    ┌─────────▼───────┐    ┌─────────▼───────┐
│   cAdvisor      │    │  Node Exporter  │    │  MySQL Backup   │
│   (port 8082)   │    │   (port 9100)   │    │   (cron 6h)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

**Services :**
- **App** : PrestaShop + MySQL + phpMyAdmin
- **Monitoring** : Prometheus + Grafana + cAdvisor + Node Exporter
- **Alertes** : Alertmanager  
- **Backup** : Sauvegarde MySQL automatique
- **CI/CD** : GitHub Actions → Docker Hub

## 🚀 Installation

### 1. Configuration
Créer `.env` :
```bash
MYSQL_ROOT_PASSWORD=root_secure
MYSQL_DATABASE=prestashop
MYSQL_USER=prestashop_user
MYSQL_PASSWORD=prestashop_secure

PRESTASHOP_ADMIN_EMAIL=admin@example.com
PRESTASHOP_ADMIN_PASSWORD=admin_secure
PS_INSTALL_AUTO=1
PS_DOMAIN=localhost:8080
PS_THEME=classic
PS_FOLDER_ADMIN=admin123
PS_FOLDER_INSTALL=install

GF_SECURITY_ADMIN_PASSWORD=grafana_admin
BACKUP_MAX_FILES=10
```

### 2. Démarrage
```bash
docker compose up -d
```

## 🌐 Accès

| Service | URL | Port |
|---------|-----|------|
| PrestaShop | http://localhost:8080 | 8080 |
| phpMyAdmin | http://localhost:8081 | 8081 |
| Grafana | http://localhost:3000 | 3000 |
| Prometheus | http://localhost:9090 | 9090 |

## 📸 Screenshots

### Docker Desktop
![Docker Desktop](https://image.noelshack.com/fichiers/2025/23/7/1749413304-capture-d-e-cran-2025-06-08-a-21-55-44.png)

### PrestaShop
![PrestaShop](https://image.noelshack.com/fichiers/2025/23/7/1749413304-capture-d-e-cran-2025-06-08-a-21-55-53.jpg)

### Grafana Dashboard
![Grafana](https://image.noelshack.com/fichiers/2025/23/7/1749413304-capture-d-e-cran-2025-06-08-a-21-56-51.png)

### CI/CD Pipeline
![CI/CD](https://image.noelshack.com/fichiers/2025/23/7/1749413304-capture-d-e-cran-2025-06-08-a-22-07-43.png)

## 📁 Structure

```
ecv-prestashop-infra/
├── docker compose.yml
├── .env
├── prestashop/
│   └── Dockerfile
├── monitoring/
│   ├── prometheus/
│   │   ├── prometheus.yml
│   │   └── alert_rules.yml
│   ├── grafana/
│   │   ├── dashboards/
│   │   └── provisioning/
│   └── alertmanager/
│       └── alertmanager.yml
├── backup/
│   ├── Dockerfile
│   ├── backup.sh
│   └── crontab
└── .github/workflows/
    └── deploy.yml
```

## 📊 Services

- **PrestaShop** : Application e-commerce
- **MySQL** : Base de données
- **Grafana/Prometheus** : Monitoring
- **Backup** : Sauvegarde MySQL (6h)
- **CI/CD** : GitHub Actions → Docker Hub
