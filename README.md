# Infrastructure PrestaShop Dockerisée
## Structure du projet

```
prestashop-infra/
├── docker-compose.yml        # Configuration principale
├── .env                      # Variables d'environnement
├── README.md                # Documentation
├── prestashop/              # Configuration PrestaShop
│   └── Dockerfile
├── monitoring/              # Configuration monitoring
│   └── prometheus.yml
├── backup/                  # Scripts de sauvegarde
│   └── backup.sh
└── .github/                # CI/CD
└── workflows/
└── deploy.yml
```

## État d'avancement

- [x] Structure initiale
- [x] Configuration PrestaShop
- [x] Monitoring
- [ ] Backup
- [x] CI/CD