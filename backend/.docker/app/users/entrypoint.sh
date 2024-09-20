#!/bin/sh
set -e

php artisan optimize:clear
php artisan migrate --force --seed

if [ "$APP_ENV" = "local" ]; then
  php artisan key:generate
fi

exec "$@"