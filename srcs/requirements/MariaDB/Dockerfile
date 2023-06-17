FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server && apt-get install -y tini

RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/creatDB.sh /etc/

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["./etc/creatDB.sh"]
