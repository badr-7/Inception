FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server

COPY ./tools/creatDB.sh /etc/

CMD ["./etc/creatDB.sh"]