#!/bin/bash
set -e
echo "Substituting environment variables in cronjob..."
envsubst < /app/sitemap-cron > /etc/cron.d/sitemap-cron
env | grep TARGET > /app/.env
echo "Executing cron in foreground..."
cron -f
