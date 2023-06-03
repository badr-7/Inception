FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx && apt-get install -y openssl

COPY  ./tools/my_nginx.conf /etc/nginx/conf.d

COPY  ./tools/self_signed_crt.sh .

CMD [ "bash", "./self_signed_crt.sh" ]
