FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx && apt-get install -y openssl && apt-get install -y tini

COPY  ./tools/my_nginx.conf /etc/nginx/conf.d

COPY  ./tools/self_signed_crt.sh .

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD [ "./self_signed_crt.sh" ]
