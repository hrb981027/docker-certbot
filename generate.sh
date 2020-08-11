#!/bin/bash

sudo docker run -it --rm --name certbot -v "$(pwd)/etc/letsencrypt:/etc/letsencrypt" -v "$(pwd)/var/lib/letsencrypt:/var/lib/letsencrypt" certbot/certbot certonly --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
