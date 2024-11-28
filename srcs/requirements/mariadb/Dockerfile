FROM debian:bullseye

RUN apt update -y && apt install --no-install-recommends mariadb-server -y

EXPOSE 3306

COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Fix permissions
RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/create_db.sh /bin/

RUN chmod +x /bin/create_db.sh

CMD ["create_db.sh"]
