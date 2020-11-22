FROM php:7.0-apache

EXPOSE 80

RUN  apt-get update \
  && apt-get install -f \
  && apt-get install -y gtk2-engines-pixbuf fonts-liberation \
  && apt-get install -y libasound2 \
  && apt-get install -y libatk-bridge2.0-0 \
  && apt-get install -y libcairo2 \
  && apt-get install -y libcups2 \
  && apt-get install -y libdrm2 \
  && apt-get install -y libgbm1 \
  && apt-get install -y libgdk-pixbuf2.0-0 \
  && apt-get install -y libgtk-3-0 \
  && apt-get install -y libnspr4 \
  && apt-get install -y libnss3 \
  && apt-get install -y libpango-1.0-0 \
  && apt-get install -y libpangocairo-1.0-0 \
  && apt-get install -y libx11-xcb1 \
  && apt-get install -y libxcomposite1 \
  && apt-get install -y libxdamage1 \
  && apt-get install -y libxfixes3 \
  && apt-get install -y libxkbcommon0 \
  && apt-get install -y libxrandr2 \
  && apt-get install -y xdg-utils \
  && apt-get install -y wget \
  && apt-get install -y gdebi-core \
  && apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils \
  && apt-get -y install xvfb \
  && apt-get -y install dbus-x11 xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable \
  && rm -rf /var/lib/apt/lists/*
COPY src/ /var/www/html


# install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

RUN apt-get update && apt-get install -y git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php/ /usr/local/bin

WORKDIR "/var/www/html"

RUN composer require chrome-php/chrome --prefer-source

RUN mkdir /.local/share/applications -p

RUN echo '' > /.local/share/applications/mimeapps.list