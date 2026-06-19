FROM debian:stable-20240701-slim

RUN apt-get update && \
    apt install systemctl -y && \
    apt-get install nginx openssl -y

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=TR/ST=ISTANBUL/L=Sariyer/O=42Istanbul/CN=ayumusak.42.fr"

RUN rm /etc/nginx/sites-available/default

COPY ./conf/wordpress.conf /etc/nginx/sites-available/default

ENTRYPOINT ["systemctl", "start", "nginx"]
