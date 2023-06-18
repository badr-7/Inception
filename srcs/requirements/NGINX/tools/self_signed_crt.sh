#!/bin/sh

mkdir -p /etc/openssl

openssl req -x509 -newkey rsa:4096 -keyout /etc/openssl/ssl_private_key.key -out /etc/openssl/ssl_certificate.crt -days 365 -nodes -subj "/CN=localhost"

nginx -g "daemon  off;"