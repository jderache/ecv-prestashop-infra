#!/bin/bash

# Variables
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="/backups/mysql_backup_${MYSQL_DATABASE}_${TIMESTAMP}.sql.gz"
MAX_BACKUPS=${BACKUP_MAX_FILES:-10}

# Backup avec approche minimaliste - juste les données
mysqldump -h mysql -u root -p"$MYSQL_ROOT_PASSWORD" \
  --single-transaction \
  --routines=false \
  --triggers=false \
  --no-tablespaces \
  --skip-lock-tables \
  --set-gtid-purged=OFF \
  --column-statistics=0 \
  --ignore-table=mysql.general_log \
  --ignore-table=mysql.slow_log \
  "$MYSQL_DATABASE" | gzip > "$BACKUP_FILE"

# Rotation - garder seulement les X plus récents
cd /backups
ls -t mysql_backup_*.sql.gz | tail -n +$((MAX_BACKUPS + 1)) | xargs -r rm
