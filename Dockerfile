FROM dunglas/frankenphp:php8.4-alpine

# Install PHP extensions using install-php-extensions script
RUN apk add --no-cache icu-libs \
 && install-php-extensions pcntl pdo_mysql intl zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
