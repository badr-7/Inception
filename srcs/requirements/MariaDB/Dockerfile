FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server

RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/creatDB.sh /etc/

CMD ["./etc/creatDB.sh"]
