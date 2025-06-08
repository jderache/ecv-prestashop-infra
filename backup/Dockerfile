FROM debian:12-slim

RUN apt-get update && apt-get install -y cron default-mysql-client gzip && rm -rf /var/lib/apt/lists/*

COPY backup.sh /backup.sh
COPY crontab /etc/cron.d/backup
RUN chmod +x /backup.sh && chmod 0644 /etc/cron.d/backup && crontab /etc/cron.d/backup

VOLUME ["/backups"]

CMD ["cron", "-f"] 