FROM debian:bullseye

RUN apt update -y && apt install --no-install-recommends mariadb-server -y

EXPOSE 3306

COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/mdb.cnf

# Fix permissions
RUN chmod +x /etc/mysql/mariadb.conf.d/mdb.cnf

COPY ./tools/create_db.sh /bin/

CMD ["create_db.sh"]
