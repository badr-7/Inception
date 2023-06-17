FROM debian:buster

RUN apt-get -y update && apt-get -y install php-fpm php-mysql wget && apt-get install -y tini

COPY ./tools/set-up.sh /

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD [ "./set-up.sh" ]