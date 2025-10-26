# Usa una imagen base de PHP (la línea que incluiste es correcta)
FROM php:8.2-apache

# 1. Instala la dependencia del sistema necesaria para compilar pdo_mysql
#    libmariadb-dev es la más común y compatible para MySQL/MariaDB.
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Instala la extensión de PHP (esto ahora funcionará)
RUN docker-php-ext-install pdo pdo_mysql

# 3. Copia los archivos del proyecto al directorio raíz del servidor web
#    Si estás usando la imagen `php:8.2-apache`, el directorio es /var/www/html/
COPY . /var/www/html/

# 4. Exponer el puerto (Apache usará el 80 por defecto)
EXPOSE 80
