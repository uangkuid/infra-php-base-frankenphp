FROM dunglas/frankenphp:php8.3-alpine

# Install PHP extensions using install-php-extensions script
RUN install-php-extensions pcntl pdo_mysql intl

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
