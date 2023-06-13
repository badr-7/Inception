FROM debian:buster

RUN apt-get -y update && apt-get -y install php-fpm php-mysql wget

COPY ./tools/set-up.sh /

ENTRYPOINT [ "/bin/bash","./set-up.sh" ]