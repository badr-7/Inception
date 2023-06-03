#!/bin/sh

mkdir /etc/openssl

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/openssl/ssl_private_key.key -out /etc/openssl/ssl_certificate.crt

openssl req -x509 -newkey rsa:4096 -keyout /etc/openssl/ssl_private_key.key -out /etc/openssl/ssl_certificate.crt -days 365 -nodes -subj "/CN=localhost" &> /dev/null

nginx -g "daemon  off;"