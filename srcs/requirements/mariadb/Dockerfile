FROM debian:stable-20240701-slim

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN sed -i "s*^bind-address            = 127.0.0.1*bind-address = 0.0.0.0*g" /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["/setup.sh"]