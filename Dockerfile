# PHP 8.2 asosiy imidj sifatida
FROM php:8.2-fpm

# Kerakli paketlarni o'rnatish
RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
    git \
    nano \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Composer'ni o'rnatish
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Ishchi katalogni belgilash
WORKDIR /var/www

# Laravel fayllarini ko‘chirish
COPY . .

# Composer install agar loyiha mavjud bo'lsa

# Laravel uchun ruxsatlar
# RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# FPM serverini ishga tushirish
CMD ["php-fpm"]

