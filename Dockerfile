FROM php:8.4-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install zip

# Install MongoDB extension
RUN pecl install mongodb-1.20.1 \
    && docker-php-ext-enable mongodb

# Install Redis extension
RUN pecl install redis-6.1.0 \
    && docker-php-ext-enable redis

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html/arpi-isms

# Copy composer files
COPY composer.json composer.lock* ./

# Install dependencies
RUN composer install --prefer-dist --no-progress --no-interaction

# Copy application files
COPY . .

CMD ["tail", "-f", "/dev/null"]
