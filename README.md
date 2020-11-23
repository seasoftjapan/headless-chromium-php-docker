# How it Works

Forked from https://github.com/mfieldhouse/docker-php-helloworld

# Setup

 - `git clone https://github.com/Laurianti/docker-php-helloworld.git`
 - `cd docker-php-helloworld/`
 - `docker build -t docker-php-helloworld .`
 - `docker run --privileged -d -p 12080:80 docker-php-helloworld`
 - `curl http://127.0.0.1:12080/`
 
# What You Should See

"Hello, World!" program - Wikipedia
