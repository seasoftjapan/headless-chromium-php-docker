# How it Works

This example lets you start playing with chrome/chromium in headless mode from PHP with Docker.

Forked from https://github.com/mfieldhouse/docker-php-helloworld
Used Chrome PHP library (installed with Composer) https://github.com/chrome-php/headless-chromium-php

# Setup

 - `git clone https://github.com/Laurianti/headless-chromium-php-docker`
 - `cd headless-chromium-php-docker/`
 - `docker build -t headless-chromium-php-docker .`
 - `docker run --privileged -d -p 12080:80 headless-chromium-php-docker`
 - `curl http://127.0.0.1:12080/`
 
# What You Should See

"Hello, World!" program - Wikipedia
