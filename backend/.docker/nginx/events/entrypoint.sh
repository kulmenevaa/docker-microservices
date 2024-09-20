#!/bin/sh
set -e

echo "API_SERVICE_NAME is $API_SERVICE_NAME"

sed -i "s/API_SERVICE_NAME/$API_SERVICE_NAME/g" /etc/nginx/conf.d/default.conf

exec "$@"