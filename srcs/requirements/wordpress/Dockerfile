FROM debian:stable-20240701-slim

WORKDIR /tmp

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y lsb-release ca-certificates curl gnupg && \
    curl -fsSL https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install -y php8.2-fpm php8.2-mysqli wget tar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php && \
    mkdir -p /var/www/html/wordpress

RUN sed -i 's*listen = /run/php/php8.2-fpm.sock*listen = 0.0.0.0:9000*g' /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 9000

CMD ["/setup.sh"]