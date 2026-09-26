FROM node:24-alpine AS assets
WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM composer:2 AS vendor
WORKDIR /app
COPY . .
# Platform reqs are checked by the runtime image, not this one.
RUN composer install --no-dev --no-scripts --no-interaction --optimize-autoloader --ignore-platform-reqs

FROM dunglas/frankenphp:1-php8.5
# ponytail: sessions/cache on files inside the container; move to SQLite + volume with the first spec that persists data.
ENV SERVER_NAME=:3000 \
    APP_ENV=production \
    APP_DEBUG=false \
    LOG_CHANNEL=stderr \
    SESSION_DRIVER=file \
    CACHE_STORE=file
WORKDIR /app
COPY --from=vendor /app .
COPY --from=assets /app/public/build public/build
RUN php artisan package:discover \
    && chown -R www-data:www-data storage bootstrap/cache /config/caddy /data/caddy
USER www-data
EXPOSE 3000
