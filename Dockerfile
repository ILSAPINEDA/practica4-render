FROM php:8.2-apache

# Instala las extensiones necesarias (pdo_mysql era el que tenías, pdo_pgsql es el que necesitas)
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql

# Resto del Dockerfile...
COPY . /var/www/html/
EXPOSE 80
