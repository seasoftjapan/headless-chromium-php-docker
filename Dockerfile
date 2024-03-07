FROM php:8.2-apache
COPY src/ /var/www/html
EXPOSE 80

# Update package information
RUN apt-get update

# Install wget
RUN apt-get install -y wget

# Download Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Chrome dependencies
RUN apt-get install -y fonts-liberation libasound2 libnspr4 libnss3 xdg-utils libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libgbm1 libgdk-pixbuf2.0-0 libgtk-3-0 libpango-1.0-0 libpangocairo-1.0-0 libxkbcommon0 libu2f-udev libvulkan1

# Install Chrome (TODO: Replace dpkg with gdebi)
RUN dpkg -i google-chrome-stable_current_amd64.deb

# Remove Chrome package
RUN rm google-chrome-stable_current_amd64.deb

# Install Composer dependencies
RUN apt-get install -y git

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Chrome PHP dependencies
RUN docker-php-ext-install sockets

# Install Chrome PHP
RUN composer require chrome-php/chrome --prefer-source
