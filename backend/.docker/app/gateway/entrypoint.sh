#!/bin/sh
set -e

php artisan optimize:clear

if [ "$APP_ENV" = "local" ]; then
  php artisan key:generate
fi

exec "$@"