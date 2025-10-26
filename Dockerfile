FROM php:8.2-apache
 
# Instala las extensiones necesarias para conectar a MySQL
RUN docker-php-ext-install pdo pdo_mysql
 
# Copia todos los archivos de tu repositorio al servidor web de Apache
COPY . /var/www/html/
 
# Expone el puerto por defecto (80)
EXPOSE 80
